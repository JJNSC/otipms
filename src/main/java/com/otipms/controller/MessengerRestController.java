package com.otipms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.otipms.dto.Alarm;
import com.otipms.service.MessengerService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class MessengerRestController {
    
	@Autowired
    private MessengerService messengerService;

}