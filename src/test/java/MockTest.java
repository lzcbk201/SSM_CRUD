import com.github.pagehelper.PageInfo;
import com.lzc.bean.Employee;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MockTest {
    @Autowired
    WebApplicationContext context;//传入SpringMvc的ioc
    MockMvc mockMvc;//虚拟mvc请求,获取到处理结果

    @Before
    public void initMockMvc() {
        MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testPage() throws Exception {
        MockHttpServletRequestBuilder pn = MockMvcRequestBuilders.get("/emp").param("pn", "1");
        System.out.println(pn);
        ResultActions perform = mockMvc.perform(pn);
        MvcResult result = perform.andReturn();
        MockHttpServletRequest request = result.getRequest();
        PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("当前页码:"+pageInfo.getPageNum());
        System.out.println("总页码:"+pageInfo.getPages());
        System.out.println("总记录数:"+pageInfo.getTotal());
        System.out.println("在页面需要连续显示的页码:");
        int [] nums = pageInfo.getNavigatepageNums();
        for (int i:nums) {
            System.out.print(" "+i);
        }
        List<Employee> list = pageInfo.getList();
        for (Employee employee:list) {
            System.out.println("ID:"+employee.getEmpId()+"-->Name:"+employee.getEmpName());
        }

    }
}
