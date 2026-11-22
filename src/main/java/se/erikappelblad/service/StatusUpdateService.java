package se.erikappelblad.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import se.erikappelblad.model.StatusUpdate;
import se.erikappelblad.model.StatusUpdateDao;

@Service
public class StatusUpdateService {
    private static final int PAGESIZE = 10;

    @Autowired
    private StatusUpdateDao statusUpdateDao;

    public void save(StatusUpdate statusUpdate) {
        statusUpdateDao.save(statusUpdate);
    }

    public StatusUpdate getLatest() {
        return statusUpdateDao.findFirstByOrderByAddedDesc();
    }

    public Page<StatusUpdate> getPage(int pageNumber) {
        PageRequest request = PageRequest.of(Math.max(0, pageNumber - 1), PAGESIZE,
                Sort.by(Sort.Direction.DESC, "added"));

        return statusUpdateDao.findAll(request);
    }

    public void delete(long id) {
        statusUpdateDao.deleteById(id);
    }

    public StatusUpdate get(long id) {
        return statusUpdateDao.findById(id).orElse(null);
    }
}
