package se.erikappelblad.tests;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.Calendar;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import jakarta.transaction.Transactional;
import se.erikappelblad.model.StatusUpdate;
import se.erikappelblad.model.StatusUpdateDao;

@SpringBootTest
@ActiveProfiles("test")
@Transactional
public class StatusTest {

    @Autowired
    private StatusUpdateDao statusUpdateDao;

    @Test
    public void testSave() {
        StatusUpdate status = new StatusUpdate("This is a test");

        statusUpdateDao.save(status);

        assertNotNull(status.getId(), "Non-null ID");
        assertNotNull(status.getAdded(), "Non-null Date");

        StatusUpdate retrieved = statusUpdateDao.findById(status.getId()).orElse(null);
        assertEquals(status, retrieved, "Matching Statusupdate");
    }

    @Test
    public void testFindLatest() {

        Calendar calendar = Calendar.getInstance();

        StatusUpdate lastStatusUpdate = null;

        for (int i = 0; i < 10; i++) {
            calendar.add(Calendar.DAY_OF_YEAR, 1);
            StatusUpdate status = new StatusUpdate("Status update " + i, calendar.getTime());

            statusUpdateDao.save(status);

            lastStatusUpdate = status;
        }

        StatusUpdate retrieved = statusUpdateDao.findFirstByOrderByAddedDesc();

        assertEquals(lastStatusUpdate, retrieved, "Latest status udate");
    }
}
