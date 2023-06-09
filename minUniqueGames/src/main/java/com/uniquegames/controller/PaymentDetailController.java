package com.uniquegames.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.uniquegames.dao.OrderDao;
import com.uniquegames.service.OrderServiceImpl;
import com.uniquegames.vo.OrderVo;

@Controller
public class PaymentDetailController {
	@Autowired
	OrderServiceImpl orderService;
	
	/** payment_detail.do **/
	@RequestMapping(value = "/payment_detail.do", method = RequestMethod.GET)
	public ModelAndView payment_detail(String m_id) {
		ModelAndView model = new ModelAndView();
		model.addObject("m_id", m_id);
		model.setViewName("/order/payment_detail");

		return model;
	}

	/** payment_detail_data.do **/
	@RequestMapping(value = "/payment_detail_data.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String payment_detail_data(String m_id, String array) {
		ArrayList<OrderVo> list = orderService.getPaymentDetail(m_id, array);

		// list 객체의 데이터를 JSON 형태로 생성
		JsonObject jlist = new JsonObject();
		JsonArray jarray = new JsonArray();

		if (list.size() == 0) {
			jlist.addProperty("nothing", true);
		} else {
			jlist.addProperty("nothing", false);
		}
		jlist.addProperty("count", orderService.getPaymentCount(m_id));
		jlist.addProperty("totalAmount", orderService.getPaymentAmount(m_id));
		jlist.addProperty("m_id", m_id);

		for (OrderVo payment : list) {
			JsonObject jobj = new JsonObject();

			jobj.addProperty("rno", payment.getRno());
			jobj.addProperty("orderdate", payment.getOrder_date());
			jobj.addProperty("gametitle", payment.getGametitle());
			jobj.addProperty("amount", payment.getAmount());

			jarray.add(jobj);
		}
		jlist.add("jlist", jarray);

		return new Gson().toJson(jlist);
	}

	/** donation_detail.do **/
	@RequestMapping(value = "/donation_detail.do", method = RequestMethod.GET)
	public ModelAndView donation_detail(String c_id) {
		ModelAndView model = new ModelAndView();
		model.addObject("c_id", c_id);
		model.setViewName("/order/donation_detail");

		return model;
	}

	/** donation_detail_data.do **/
	@RequestMapping(value = "/donation_detail_data.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String donation_detail_data(String c_id, String array) {
		ArrayList<OrderVo> list = orderService.getDonationDetail(c_id, array);

		// list 객체의 데이터를 JSON 형태로 생성
		JsonObject jlist = new JsonObject();
		JsonArray jarray = new JsonArray();

		if (list.size() == 0) {
			jlist.addProperty("nothing", true);
		} else {
			jlist.addProperty("nothing", false);
		}
		jlist.addProperty("expected", orderService.getExpected(c_id));
		jlist.addProperty("totalAmount", orderService.getTotalDonation(c_id));
		jlist.addProperty("c_id", c_id);

		for (OrderVo payment : list) {
			JsonObject jobj = new JsonObject();

			jobj.addProperty("rno", payment.getRno());
			jobj.addProperty("orderdate", payment.getOrder_date());
			jobj.addProperty("gametitle", payment.getGametitle());
			jobj.addProperty("amount", payment.getAmount());

			jarray.add(jobj);
		}
		jlist.add("jlist", jarray);

		return new Gson().toJson(jlist);
	}
	
	/** donation_rank.do **/
	@RequestMapping(value = "/donation_rank.do", method = RequestMethod.GET)
	public ModelAndView donation_rank(String c_id) {
		ModelAndView model = new ModelAndView();
		model.addObject("c_id", c_id);
		model.setViewName("/order/donation_rank");
		
		return model;
	}
	
	/** donation_rank_data.do **/
	@RequestMapping(value = "/donation_rank_data.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String donation_rank_data(String c_id) {
		ArrayList<OrderVo> list = orderService.getDonationRank(c_id);
		
		// list 객체의 데이터를 JSON 형태로 생성
		JsonObject jlist = new JsonObject();
		JsonArray jarray = new JsonArray();
		
		if (list.size() == 0) {
			jlist.addProperty("nothing", true);
		} else {
			jlist.addProperty("nothing", false);
		}
		jlist.addProperty("c_id", c_id);
		
		for (OrderVo payment : list) {
			JsonObject jobj = new JsonObject();
			
			jobj.addProperty("rno", payment.getRno());
			jobj.addProperty("userId", payment.getUserId());
			jobj.addProperty("gametitle", payment.getGametitle());
			jobj.addProperty("amount", payment.getAmount());
			
			jarray.add(jobj);
		}
		jlist.add("jlist", jarray);
		
		return new Gson().toJson(jlist);
	}
}
