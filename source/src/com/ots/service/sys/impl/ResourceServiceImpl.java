package com.ots.service.sys.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ots.dao.BaseDaoI;
import com.ots.domain.sys.Tresource;
import com.ots.dto.base.SessionInfo;
import com.ots.dto.base.Tree;
import com.ots.dto.sys.Resource;
import com.ots.service.sys.ClientServiceI;
import com.ots.service.sys.ResourceServiceI;

@Service
public class ResourceServiceImpl implements ResourceServiceI {

	@Autowired
	private BaseDaoI<Tresource> resourceDao;
	
	@Autowired
	private ClientServiceI clientService;

	@Override
	public List<Resource> treeGrid() {
		List<Resource> lr = new ArrayList<Resource>();
		List<Tresource> l = resourceDao
				.find("select distinct t from Tresource t left join fetch t.resource  order by t.seq");
		if ((l != null) && (l.size() > 0)) {
			for (Tresource t : l) {
				Resource r = new Resource();
				BeanUtils.copyProperties(t, r);
				r.setCstate(t.getState());
				if (t.getResource() != null) {
					r.setPid(t.getResource().getId());
					r.setPname(t.getResource().getName());
				}
				r.setIconCls(t.getIcon());
				lr.add(r);
			}
		}
		return lr;
	}

	@Override
	public void add(Resource r) {
		Tresource t = new Tresource();
		SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		t.setCreatedatetime(format.format(System.currentTimeMillis()));
		t.setDescription(r.getDescription());
		t.setIcon(r.getIcon());
		t.setName(r.getName());
		if ((r.getPid() != null) && !"".equals(r.getPid())) {
			t.setResource(resourceDao.get(Tresource.class, r.getPid()));
		}
		t.setResourcetype(r.getResourcetype());
		t.setSeq(r.getSeq());
		t.setState(r.getCstate());
		t.setUrl(r.getUrl());
		resourceDao.save(t);
	}

	@Override
	public void delete(Long id) {
		Tresource t = resourceDao.get(Tresource.class, id);
		del(t);
	}

	private void del(Tresource t) {
		if ((t.getResources() != null) && (t.getResources().size() > 0)) {
			for (Tresource r : t.getResources()) {
				del(r);
			}
		}
		resourceDao.delete(t);
	}

	@Override
	public void edit(Resource r) {
		Tresource t = resourceDao.get(Tresource.class, r.getId());
		t.setDescription(r.getDescription());
		t.setIcon(r.getIcon());
		t.setName(r.getName());
		if ((r.getPid() != null) && !"".equals(r.getPid())) {
			t.setResource(resourceDao.get(Tresource.class, r.getPid()));
		}
		t.setResourcetype(r.getResourcetype());
		t.setSeq(r.getSeq());
		t.setState(r.getCstate());
		t.setUrl(r.getUrl());
		resourceDao.update(t);
	}

	@Override
	public Resource get(Long id) {
		Tresource t = resourceDao.get(Tresource.class, id);
		Resource r = new Resource();
		BeanUtils.copyProperties(t, r);
		r.setCstate(t.getState());
		if (t.getResource() != null) {
			r.setPid(t.getResource().getId());
			r.setPname(t.getResource().getName());
		}
		return r;
	}

	@Override
	public List<Tree> tree(SessionInfo sessionInfo) {
		List<Tresource> l = null;
		List<Tree> lt = new ArrayList<Tree>();

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("resourcetype", 0);// 菜单类型的资源

		if (sessionInfo != null) {
			if ("admin".equals(sessionInfo.getLoginname())) {
				l = resourceDao
						.find("select distinct t from Tresource t  where t.resourcetype = :resourcetype  order by t.seq",
								params);
			} else {
				if (sessionInfo.isClient()) {
					l = clientService.resourceTree(0, Long.valueOf(sessionInfo.getId()));
				} else {
					params.put("userId", Long.valueOf(sessionInfo.getId()));// 自查自己有权限的资源
					l = resourceDao
							.find("select distinct t from Tresource t join fetch t.roles role join role.users user where t.resourcetype = :resourcetype and user.id = :userId order by t.seq",
									params);
				}
			}
		} else {
			return null;
		}

		if ((l != null) && (l.size() > 0)) {
			for (Tresource r : l) {
				Tree tree = new Tree();
				tree.setId(r.getId().toString());
				if (r.getResource() != null) {
					tree.setPid(r.getResource().getId().toString());
				} else {
					tree.setState("closed");
				}
				tree.setText(r.getName());
				tree.setIconCls(r.getIcon());
				Map<String, Object> attr = new HashMap<String, Object>();
				attr.put("url", r.getUrl());
				tree.setAttributes(attr);
				lt.add(tree);
			}
		}
		return lt;
	}

	@Override
	public List<Tree> allTree(boolean flag) {
		List<Tresource> l = null;
		List<Tree> lt = new ArrayList<Tree>();
		if (flag) {
			l = resourceDao
					.find("select distinct t from Tresource t left join fetch t.resource  order by t.seq");
		} else {
			l = resourceDao
					.find("select distinct t from Tresource t left join fetch t.resource where t.resourcetype =0 order by t.seq");
		}
		if ((l != null) && (l.size() > 0)) {
			for (Tresource r : l) {
				Tree tree = new Tree();
				tree.setId(r.getId().toString());
				if (r.getResource() != null) {
					tree.setPid(r.getResource().getId().toString());
				}
				tree.setText(r.getName());
				tree.setIconCls(r.getIcon());
				Map<String, Object> attr = new HashMap<String, Object>();
				attr.put("url", r.getUrl());
				tree.setAttributes(attr);
				lt.add(tree);
			}
		}
		return lt;
	}

	@Override
	public List<String> resourceAllList() {
		List<String> resourceList = new ArrayList<String>();
		List<Tresource> l = resourceDao
				.find("select distinct t from Tresource t left join fetch t.resource  order by t.seq");
		for (int i = 0; i < l.size(); i++) {
			resourceList.add(l.get(i).getUrl());
		}
		return resourceList;
	}
}
