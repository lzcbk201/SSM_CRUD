package com.lzc.service;

import com.github.pagehelper.PageHelper;
import com.lzc.bean.Employee;
import com.lzc.bean.EmployeeExample;
import com.lzc.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {
    @Autowired
    EmployeeMapper employeeMapper;
    /*
        查询所有员工
     */
    public List<Employee> getAll(){
        return employeeMapper.selectByExampleWithDept(null);
    }

    /*
       新增员工
     */
    public void saveEmp(Employee employee) {
        employeeMapper.insertSelective(employee);
    }


    /*
        删除员工
     */
    public void deleteEmp(Integer id) {
        employeeMapper.deleteByPrimaryKey(id);
    }



    /*
    检验用户名是否可用  true:可用
     */
    public boolean checkRepeat(String empName) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count = employeeMapper.countByExample(example);
        return count == 0;
    }
    /*
    按照ID查
     */
    public Employee getEmp(Integer id) {
        return employeeMapper.selectByPrimaryKey(id);
    }

    public void updateEmp(Employee employee) {
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    public void deleteBatch(List<Integer> ids) {
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andEmpIdIn(ids);
        //delete from xx where emp_id in (1,2,3)
        employeeMapper.deleteByExample(employeeExample);
    }
}
