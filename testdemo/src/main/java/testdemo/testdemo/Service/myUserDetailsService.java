package testdemo.testdemo.Service;

import jakarta.annotation.Resource;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import testdemo.testdemo.Model.user;
import testdemo.testdemo.Model.userPrinciple;
import testdemo.testdemo.Repositroy.userRepo;

import java.util.ArrayList;
import java.util.List;

@Service
public class myUserDetailsService implements UserDetailsService {

    @Resource
    private userRepo userRepo;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        user user = userRepo.findById(username).orElse(null);
        if(user == null){
            System.out.println("User Not Found");
            throw new UsernameNotFoundException("user not found");
        }
        List<GrantedAuthority> userRole = new ArrayList<>();
        userRole.add(new SimpleGrantedAuthority(user.getUser_Role()));
        return new org.springframework.security.core.userdetails.User(
                user.getUsername(), user.getPassword(),userRole);
    }
}
