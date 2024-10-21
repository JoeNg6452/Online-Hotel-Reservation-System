package testdemo.testdemo.Controller;
import jakarta.annotation.Resource;
import org.springframework.boot.autoconfigure.graphql.ConditionalOnGraphQlSchema;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import testdemo.testdemo.Model.addHotelForm;
import testdemo.testdemo.Model.hotel;
import testdemo.testdemo.Model.updateHotelForm;
import testdemo.testdemo.Model.user;
import testdemo.testdemo.Service.adminService;
import testdemo.testdemo.Service.bookingManagementService;

import java.io.IOException;
import java.util.*;
@Controller
@RequestMapping("/admin")
public class adminController {
    @Resource
    private adminService adminServ;
    @Resource
    private bookingManagementService bookingManagementServ;

    @GetMapping("/listUsers")
    public ModelAndView listUsers(){
        return new ModelAndView("listUser", "users", adminServ.getAllUsers());
    }

    @GetMapping("/listUser/{username}")
    public ModelAndView listUser(ModelMap model, @PathVariable("username")String username){
        return new ModelAndView("UserManage", "userEntry", adminServ.getUserByUsername(username));
    }

    @GetMapping("/createUser")
    public ModelAndView createUser(ModelMap model){
        return new ModelAndView("addUser", "addUserForm", new user());
    }

    @PostMapping("/createUser")
    public String createUser(@ModelAttribute("addUserForm") user user){
        adminServ.addUser(user);
        return "redirect:/admin/listUsers";
    }

    @GetMapping("/editUser/{username}")
    public String editUser(ModelMap model, @PathVariable("username") String username){
        model.addAttribute("userEntry",adminServ.getUserByUsername(username));
        model.addAttribute("userForm",new user());
        return "editUser";
    }

    @PostMapping("/editUser/{username}")
    public String updateUser(@ModelAttribute("userForm")user user){
        adminServ.updateUser(user);
        return "redirect:/admin/listUsers";
    }

    @GetMapping("/deleteUser/{username}")
    public String deleteUser(@PathVariable("username") String username){
        adminServ.deleteUser(username);
        return "redirect:/admin/listUsers";
    }
    @GetMapping("/addHotel")
    public ModelAndView newHotel(ModelMap model){
        return new ModelAndView("addHotel", "form", new addHotelForm());
    }

    @PostMapping("/addHotel")
    public String addHotel(@ModelAttribute("form") addHotelForm form) throws IOException {
        adminServ.addHotel(form);
        return "redirect:/AllHotels";
    }

    @GetMapping("/deleteHotel/{name}")
    public String deleteHotel(@PathVariable("name") String name) {
        adminServ.deleteHotel(name);
        return "redirect:/AllHotels";
    }
    @GetMapping("/editHotel/{hotelname}")
    public String editHotel(@PathVariable("hotelname") String hotelname, ModelMap model){
        model.addAttribute("hotelInfo", adminServ.getHotel(hotelname));
        model.addAttribute("updateHotelForm", new updateHotelForm());
        return "editHotel";
    }

    @PostMapping("/editHotel/{hotelname}")
    public String editHotel(@ModelAttribute("updateHotelForm") updateHotelForm form, @PathVariable("hotelname") String hotel) throws IOException {
        adminServ.updateHotel(form);
        return "redirect:/hotelInfo/{hotelname}";
    }
    @GetMapping("/allComments")
    public ModelAndView listAllComments(){
        return new ModelAndView("listComments", "comments", adminServ.getAllComments());
    }

    @GetMapping ("/deleteComment/{id}")
    public String deleteComment(@PathVariable("id") int id){
        adminServ.deleteComment(id);
        return "redirect:/admin/allComments";
    }

    @GetMapping("/allBookings")
    public ModelAndView listAllBookings(){
        return new ModelAndView("listBookings", "bookings", bookingManagementServ.getAllBookings());
    }

    @GetMapping("/deleteBooking/{id}")
    public String deleteBooking(@PathVariable("id") int id){
        adminServ.deleteBooking(id);
        return "redirect:/admin/allBookings";
    }

}
