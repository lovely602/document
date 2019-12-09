## Constraint注解开发使用
前言 ：虽然现在有很多有用的验证注解，如@NotNull,@NotBlank,@NotEmpty,@Email等等。但是有可能有时候根据项目需要这些验证注解不够用。
       这时候就需要用到自定义验证注解。
1.@Constraint注解：
   自定义验证类型的注解的逻辑一般是@Constraint帮我们处理。

2.代码讲解：

```
/**
 * value是否属于当前上下文内容
 * 注：当被校验对象为空时，校验为通过，所以如果需要校验对象必填，请自行结合相关校验注解
 */
@Target({ElementType.FIELD, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = {SameTenant.StringChecker.class, SameTenant.LongChecker.class})
@Documented
public @interface SameTenant {

    String message() default "用户不存在或者不属于当前组织";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};

    class StringChecker implements ConstraintValidator<SameTenant, String> {

        @Override
        public void initialize(SameTenant arg0) {
        }

        @Override
        public boolean isValid(String value, ConstraintValidatorContext context) {

            System.out.print("到注解里面了"+value);
            if (StringUtils.isBlank(value)) {

                return true;
            }
            return false;
        }
    }

    class LongChecker implements ConstraintValidator<SameTenant, Long> {

        @Override
        public void initialize(SameTenant arg0) {
        }

        @Override
        public boolean isValid(Long value, ConstraintValidatorContext context) {
            if (null == value) {
                return true;
            }
            return false;
        }
    }
}
```
在上面这个自定义验证注解中，
@Constraint(validatedBy = {SameTenant.StringChecker.class, SameTenant.LongChecker.class})
这代表注解的处理逻辑是SameTenant.StringCheck.class和SameTenant.LongCheck.class这两个类，也可以只定义一个，多个用逗号分开。
这两个类一个处理String类型一个处理Long类型。

自定义验证类需要实现ConstraintValidator接口，它有两个泛型，一个是我们自定义的注解类，另一个就是验证的数据类型（例如：写了String类型的数据，那么这个注解要放到String类型的字段上才会生效，）
若是Object类型的数据，它可以接受任何数据类型的数据。通常须实现两个方法。initialize和isValid，第一个是初始化方法，第二个是验证的逻辑方法，返回true则验证通过，返回false则不通过。


这个自定义注解逻辑处理类由于实现了ConstraintValidator接口，所以它默认被spring容器管理成bean。可以在这个类里加入@Autowired或者@Resource(name="")引入其他类。不用在类上表名@Component
表明这是spring管理的bean

自定义验证类型注解类里面由于是验证数据，一般在里面加上

String message() default "用户不存在，或不属于当前组织";

Class<?> [] groups() default {};

Class<? extends PayLoad> [] payload() default {};
