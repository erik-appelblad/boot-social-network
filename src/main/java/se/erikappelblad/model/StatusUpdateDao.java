package se.erikappelblad.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface StatusUpdateDao extends JpaRepository<StatusUpdate, Long> {
    StatusUpdate findFirstByOrderByAddedDesc();
}
