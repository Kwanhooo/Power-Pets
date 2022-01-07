import com.mygroup.powerpets.domain.User;
import com.mygroup.powerpets.persistence.impl.UserDaoImpl;

public class Test {
    public static void main(String[] args) {
        UserDaoImpl userDaoImpl = new UserDaoImpl();
        User user = userDaoImpl.selectById(10000);
    }
}
