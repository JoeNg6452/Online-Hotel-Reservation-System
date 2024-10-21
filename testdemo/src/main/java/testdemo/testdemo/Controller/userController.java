package testdemo.testdemo.Controller;

import jakarta.annotation.Resource;
import org.aspectj.asm.IModelFilter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import testdemo.testdemo.Model.user;
import testdemo.testdemo.Service.adminService;
import testdemo.testdemo.Service.bookingManagementService;
import testdemo.testdemo.Service.userService;

import java.security.Principal;

@Controller
@RequestMapping("/self")
public class userController {
    @Resource
    private adminService adminServ;
    @Resource
    private bookingManagementService bookingManagementServ;

    @Resource
    private userService userServ;

    @GetMapping("/profile")
    public ModelAndView profile(Principal principal){
        return new ModelAndView("profile", "userInfo", adminServ.getUserByUsername(principal.getName()));
    }

    @GetMapping("/profile/update")
    public String profileUpdate(ModelMap model, Principal principal){
        model.addAttribute("userUpdateForm", new user());
        model.addAttribute("userInfo", adminServ.getUserByUsername(principal.getName()));
        return "userProfile";
    }

    @PostMapping("/profile/update")
    public String profileUpdate(@ModelAttribute("userUpdateForm") user user, Principal principal){
        adminServ.updateUserProfile(user, principal);
        return "redirect:/self/profile";
    }

    @GetMapping("/deleteAc")
    public String deleteAccount(Principal principal){
        userServ.deleteAccount(principal.getName());
        return "redirect:/login";
    }

    @GetMapping("/myBookings")
    public String showMyBookings(ModelMap model, Principal principal){
        model.addAttribute("bookings", bookingManagementServ.getAllMyBookings(principal.getName()));
        model.addAttribute("user", principal.getName());
        return "userBookings";
    }

    @GetMapping("/comhist")
    public String showComHistory(ModelMap model, Principal principal){
       model.addAttribute("comments", userServ.getUserComments(principal.getName()));
       model.addAttribute("user", principal.getName());
        return "userComments";
    }

    @GetMapping("/favHotels")
    public String userFavHotels(ModelMap model, Principal principal){
        model.addAttribute("favHotels", userServ.getUserFavHotels(principal.getName()));
        model.addAttribute("user", principal.getName());
        return "userFavHotels";
    }

    @GetMapping("/removeFav/{hotelname}")
    public String removeFavHotel(@PathVariable("hotelname") String hotelname, Principal principal){
        userServ.removeFavHotel(hotelname, principal.getName());
        return "redirect:/self/favHotels";
    }

    @GetMapping("/deleteComment/{id}")
    public String deleteMyComment(@PathVariable("id") int id){
        userServ.deleteMyComment(id);
        return "redirect:/self/comhist";
    }

    @GetMapping("/deleteBooking/{id}")
    public String deleteMyBooking(@PathVariable("id") int id){
        userServ.deleteMyBooking(id);
        return "redirect:/self/myBookings";
    }

}
