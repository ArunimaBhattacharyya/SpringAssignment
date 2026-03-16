package com.example.SpringBoot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

    @Autowired
    LoginRepository loginRepository;

    public UserEntity registerUser(UserEntity userEntity){
        return loginRepository.save(userEntity);
    }

    public boolean validateUser(String username, String password){
        UserEntity user = loginRepository.findByUsername(username);
        if(user == null){
            return false;
        }
        if(user.getPassword().equals(password)){
            return true;
        }

        return false;
    }
}
