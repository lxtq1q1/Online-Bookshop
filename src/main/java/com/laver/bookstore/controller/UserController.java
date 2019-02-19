package com.laver.bookstore.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import com.sun.xml.internal.bind.v2.runtime.reflect.opt.Const;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.laver.bookstore.domain.Book;
import com.laver.bookstore.domain.BookOrder;
import com.laver.bookstore.domain.BookOrderExample;
import com.laver.bookstore.domain.OrderDetail;
import com.laver.bookstore.domain.OrderDetailExample;
import com.laver.bookstore.domain.User;
import com.laver.bookstore.domain.BookOrderExample.Criteria;
import com.laver.bookstore.service.IBookOrderService;
import com.laver.bookstore.service.IBookService;
import com.laver.bookstore.service.IOrderDetailService;
import com.laver.bookstore.service.IUserService;

@Controller
public class UserController {
	
	@Resource
	private IUserService userService;
    @Resource
    private IBookService bookService;
    @Resource
    private IBookOrderService bookOrderService;
    @Resource
    private IOrderDetailService orderDetailService;


    @ResponseBody
    @RequestMapping("/userReg")
    public String userReg(String userName,String passWord){
        User user=new User();
        user.setUname(userName);
        user.setPassword(passWord);
        if(userService.userReg(user)){
            return "success";
        }
        return "false";
    }

    @ResponseBody
    @RequestMapping("/loginCheck")
    public String loginCheck(String userName,String passWord,HttpSession session){
        if(userName==null||userName.equals("")){
            return "nameEmpty";
        }
        if(passWord==null||passWord.equals("")){
            return "pwdEmpty";
        }
        User user=new User();
        user.setUname(userName);
        user.setPassword(passWord);
        if(userService.userLogin(user).getUid()!=null){
            User sessionUser=userService.userLogin(user);
            sessionUser.setPassword("");
            session.setAttribute("user",sessionUser);
            return "success";
        }
        return "false";
    }
    @RequestMapping("/manaUser")
    public String manaUser(Integer pageNum,Model model){
        if(pageNum!=null){
            PageHelper.startPage(pageNum,com.laver.bookstore.util.Constant.MU_PAGE_SIZE);
        }else{
            PageHelper.startPage(1, com.laver.bookstore.util.Constant.MU_PAGE_SIZE);
        }
        List<User> users = userService.findAllUser();
        PageInfo<User> pageInfo = new PageInfo<User>(users);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("users", users);
        return "manage/user";
    }

    @RequestMapping("/modifyUserPage")
    public String modifyUserPage(Model model,Integer uid){
        User user = userService.findUserById(uid);
        model.addAttribute("user", user);
        return "manage/user-modify";
    }
    @RequestMapping("/modifyUser")
    public ModelAndView manaUser(Integer uid,String userName,String password,String gender,String email,String phone,String address){
        User user=new User();
        user.setUid(uid);
        user.setUname(userName);
        user.setPassword(password);
        user.setGender(gender);
        user.setEmail(email);
        user.setPhone(phone);
        user.setAdress(address);
        userService.userModify(user);
        return new ModelAndView("redirect:/manager_user.do");
    }
    @RequestMapping("/delUser")
    public ModelAndView deleteUser(Integer uid){
        userService.deleteByUid(uid);
        return new ModelAndView("redirect:/manaUser.do");
    }
    @RequestMapping("/addUser")
    public ModelAndView addUser(String userName,String passWord,String gender,String email,String phone,String address){
        User user = new User();
        user.setUname(userName);
        user.setPassword(passWord);
        user.setGender(gender);
        user.setEmail(email);
        user.setPhone(phone);
        user.setAdress(address);
        userService.addUser(user);
        return new ModelAndView("redirect:/manaUser.do");
    }

    @RequestMapping("/updateUserPage")
    public String updateUserPage(Model model,HttpSession session){
        User sessionUser= (User) session.getAttribute("user");
        User user=userService.findUserById(sessionUser.getUid());
        model.addAttribute("user",user);
        return "front/update";
    }

    @RequestMapping("/updateUser")
    public ModelAndView updateUser(Integer uid,String uname,String gender,String email,String phone,String address){
        User user=new User();
        user.setUid(uid);
        user.setUname(uname);
        user.setGender(gender);
        user.setEmail(email);
        user.setPhone(phone);
        user.setAdress(address);
        userService.userModify(user);
        return new ModelAndView("redirect:/index.do");
    }
    @RequestMapping("/logout")
    public ModelAndView logout(HttpSession session){
        session.removeAttribute("user");
        session.removeAttribute("cart");
        return new ModelAndView("redirect:/index.do");
    }
    @RequestMapping("/userOrder")
    public String userOrder(Model model,Integer uid,Integer pageNum){
        Set<Book> books=new HashSet<Book>();
        BookOrderExample example = new BookOrderExample();
        Criteria cri = example.createCriteria();
        cri.andUidEqualTo(uid);
        OrderDetailExample example2 = new OrderDetailExample();
        List<OrderDetail> orderDetails = orderDetailService.selectByExample(example2);
        for(OrderDetail od:orderDetails){
            Book book = bookService.findById(od.getBookId());
            books.add(book);
        }
        if(pageNum!=null){
            PageHelper.startPage(pageNum,com.laver.bookstore.util.Constant.UO_PAGE_SIZE,"date desc");
        }else{
            PageHelper.startPage(1, com.laver.bookstore.util.Constant.UO_PAGE_SIZE,"date desc");
        }
        List<BookOrder> bookOrders = bookOrderService.selectByExample(example);
        PageInfo<BookOrder> pageInfo = new PageInfo<BookOrder>(bookOrders);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("bookOrders", bookOrders);
        model.addAttribute("books", books);
        model.addAttribute("orderDetails", orderDetails);
        return "front/user-order";
    }
    @ResponseBody
    @RequestMapping("/updatePwd")
    public String updatePwd(Integer uid,String password,String newPassword){
        if(password==null||password.equals("")){
            return "pwdEmpty";
        }
        if(newPassword==null||newPassword.equals("")){
            return "newEmpty";
        }
        boolean flag = userService.updatePwd(uid, password, newPassword);
        if(flag){
            return "success";
        }
        return "false";
    }

    //修改
    @RequestMapping("backLoginPage")//后台登陆重写
    public String loginPage(){
        return "manage/manager_login";//后台登陆manager_login.jsp

    }
    @RequestMapping("backLogin")//登陆验证重写
    public String login(HttpSession session,String username, String password,Model model) {
        if (!StringUtils.isEmpty(username) && !StringUtils.isEmpty(password)) {//如果username/password不为空且username=admin&&password=admin,返回index,jsp
            if (password.equals("1") && username.equals("sysadmin")) {
                session.setAttribute("sysadmin","1"	);
                List<User> users = userService.findAllUser();
                model.addAttribute("users", users);
                return "manage/manager_index";//username/password不为空且username=admin&&password=admin,返回index.jsp
            }
        }
        return "manage/manager_login";//验证失败则回到manager_login.jsp
    }
    @RequestMapping("/manager_index")//主页重写
    public String manager_index(Model model){
        return "manage/manager_index";
    }


    @RequestMapping("/manager_user")//用户管理重写
    public String manager_user(Integer pageNum,Model model){
        if(pageNum!=null){
            PageHelper.startPage(pageNum,com.laver.bookstore.util.Constant.MU_PAGE_SIZE);
        }else{
            PageHelper.startPage(1, com.laver.bookstore.util.Constant.MU_PAGE_SIZE);
        }
        List<User> users = userService.findAllUser();
        PageInfo<User> pageInfo = new PageInfo<User>(users);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("users", users);
        return "manage/manager_user";
    }

    @RequestMapping("/manager_user_modify")//用户信息修改界面重写
    public String manager_user_modify(Model model,Integer uid){
        User user = userService.findUserById(uid);
        model.addAttribute("user", user);
        return "manage/manager_user_modify";
    }




}
