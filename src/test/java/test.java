import com.lzc.bean.Department;
import com.lzc.bean.Employee;
import com.lzc.dao.DepartmentMapper;
import com.lzc.dao.EmployeeMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.exception.InvalidConfigurationException;
import org.mybatis.generator.exception.XMLParserException;
import org.mybatis.generator.internal.DefaultShellCallback;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class test {
//    @Test
//    public void test() throws Exception {
//        List<String> warnings = new ArrayList<String>();
//        boolean overwrite = true;
//        File configFile = new File("mbg.xml");
//        ConfigurationParser cp = new ConfigurationParser(warnings);
//        Configuration config = cp.parseConfiguration(configFile);
//        DefaultShellCallback callback = new DefaultShellCallback(overwrite);
//        MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
//        myBatisGenerator.generate(null);
//        System.out.println("生成完成!!");
//
//    }
    @Autowired
    EmployeeMapper employeeMapper;
    DepartmentMapper departmentMapper;
    @Test
    public void restCRUD(){
        System.out.println(employeeMapper);
        System.out.println(employeeMapper.selectByPrimaryKey(1));
        System.out.println(employeeMapper.selectByPrimaryKeyWithDept(1));
        //employeeMapper.insertSelective(new Employee(null,"李四","女","lishi@gmail.com",2));

        
    }
}
