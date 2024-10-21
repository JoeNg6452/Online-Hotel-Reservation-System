package testdemo.testdemo.Controller;

import jakarta.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import testdemo.testdemo.Model.user;
import testdemo.testdemo.Service.adminService;

import java.security.Principal;
import java.util.List;

@Controller
public class indexController {
    @Resource
    private adminService adminServ;


    @GetMapping("/")
    public String index(){
        return "redirect:/AllHotels";
    }

    @GetMapping("/login")
    public String login(){
        return "login";
    }

    @GetMapping("/registration")
    public String registration(ModelMap model){
        model.addAttribute("userReg", new user());
        return "registration";
    }

    @PostMapping("registration")
    public String register(@ModelAttribute("userReg") user user){
        adminServ.addUser(user);
        return "redirect:/login";
    }


}
