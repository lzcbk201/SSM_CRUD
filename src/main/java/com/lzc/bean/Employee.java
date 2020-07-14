
package com.lzc.bean;

import lombok.Data;

import javax.validation.constraints.Email;
import javax.validation.constraints.Pattern;

@Data
public class Employee {
    private Integer empId;
    @Pattern(regexp = "(^[a-zA-Z0-9_-]{4,16}$)|(^[\\u4E00-\\u9FA5]{2,6})",message = "用户名必须是4-16位英文,或者2-6位中文(Hibernate校验)")
    private String empName;
    private String gender;
    //@Email
    @Pattern(regexp = "^([A-Za-z0-9_\\-\\.])+\\@([A-Za-z0-9_\\-\\.])+\\.([A-Za-z]{2,4})$",message = "邮箱格式不正确(Hibernate校验)")
    private String email;
    private Integer dId;
    private Department department;
}
