package testdemo.testdemo.Controller;

import jakarta.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import testdemo.testdemo.Model.booking;
import testdemo.testdemo.Model.bookingForm;
import testdemo.testdemo.Model.user;
import testdemo.testdemo.Service.bookingManagementService;
import testdemo.testdemo.Service.adminService;

import java.security.Principal;
@Controller
public class bookingManagementController {
    @Resource
    private bookingManagementService bookingManagementServ;
    @Resource
    private adminService adminService;


    @GetMapping("/confirmBooking/{name}")
    public String confirmBooking(@PathVariable("name") String hotelname, ModelMap model, Principal principal){
        model.addAttribute("hotelInfo", adminService.getHotel(hotelname));
        model.addAttribute("userInfo", adminService.getUserByUsername(principal.getName()));
        model.addAttribute("bookingForm", new bookingForm());
        return "confirmBooking";
    }

    @PostMapping("/confirmBooking/{name}")
    public String confirmBooking(@ModelAttribute("bookingForm") bookingForm bookingForm, @ModelAttribute("userInfo") user user){
        bookingManagementServ.addBooking(bookingForm.getHotelname(), bookingForm.getUsername(), bookingForm.getDate(), bookingForm.getPrice(), bookingForm.getRoom_type(), user);
        return "redirect:/self/myBookings";
    }

}
