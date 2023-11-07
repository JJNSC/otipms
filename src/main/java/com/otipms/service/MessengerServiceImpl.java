package com.otipms.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.otipms.dao.MessengerDao;
import com.otipms.dto.Alarm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MessengerServiceImpl implements MessengerService {
	
	@Autowired
	public MessengerDao messengerDao;
	
	
}
