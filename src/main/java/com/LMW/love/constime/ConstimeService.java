package com.LMW.love.constime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ConstimeService {

	@Autowired
	private ConstimeDAO constimeDAO;
}
