package com.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dao.GetEDao;
import com.dao.SaveEDao;
import com.model.FoodConsume;
import com.model.FoodContent;
import com.model.GetE;
import com.model.GraphOne;
import com.model.GraphOneHead;
import com.model.GraphOneModel;
import com.model.GraphTwo;
import com.model.GraphTwoHead;
import com.model.OrganContent;
import com.model.OrganWt;
import com.model.Radio;
import com.model.SVTModel;
import com.model.SVTRAModel;
import com.model.SaveE;

public class Calculate {	
	//加一些判断来处理用户误操作、误上传
	//注意每个query查到空时的操作
	private List<String> radioList;
	private List<String> ageList;
    private GraphOneHead graphOneHead;
	private List<GraphOneModel> graphOneModel;
	private List<GraphOne> graphOne;//存图1多图数据
    private GraphTwoHead aGraphTwoHead;
	private List<SVTModel> sVTModel;
	private List<GraphTwo> graphTwo;//存图2多图数据

	public List<GraphOneModel> getGraphOneModel() {
		return graphOneModel;
	}
	public void setGraphOneModel(List<GraphOneModel> graphOneModel) {
		this.graphOneModel = graphOneModel;
	}
	public List<GraphOne> getGraphOne() {
		return graphOne;
	}
	public void setGraphOne(List<GraphOne> graphOne) {
		this.graphOne = graphOne;
	}
	public List<SVTModel> getSVTModel() {
		return sVTModel;
	}
	public void setSVTModel(List<SVTModel> sVTModel) {
		this.sVTModel = sVTModel;
	}
	public List<GraphTwo> getGraphTwo() {
		return graphTwo;
	}
	public void setGraphTwo(List<GraphTwo> graphTwo) {
		this.graphTwo = graphTwo;
	}
	public List<String> getRadioList() {
		return radioList;
	}
	public void setRadioList(List<String> radioList) {
		this.radioList = radioList;
	}
	public List<String> getAgeList() {
		return ageList;
	}
	public void setAgeList(List<String> ageList) {
		this.ageList = ageList;
	}
	public GraphOneHead getGraphOneHead() {
        return graphOneHead;
    }
    public void setGraphOneHead(GraphOneHead graphOneHead) {
        this.graphOneHead = graphOneHead;
    }
    public GraphTwoHead getGraphTwoHead() {
        return aGraphTwoHead;
    }
    public void setGraphTwoHead(GraphTwoHead aGraphTwoHead) {
        this.aGraphTwoHead = aGraphTwoHead;
    }
	public String execute() throws Exception{	
			getGraphOneListFunc(radioList);
			getGraphTwoListFunc(radioList,ageList);
			return "SUCCESS";
	}

	public GraphOne getGraphOneListSQL(String radio) throws Exception {//这里的参数需要改成radioLists
		GraphOne aGraphOne = new GraphOne();
    	SqlSession session = Constants.getSqlSession();
		SaveEDao saveEDao = session.getMapper(SaveEDao.class);
		setGraphOneModel(saveEDao.queryGraphOne(radio));//用这里的值创建出Map<String unit,List<GraphOneModel>> 的结构画图
		aGraphOne.setGraphOneModel(saveEDao.queryGraphOne(radio));//新加0801n
		GraphOneHead graphOneHead = new GraphOneHead();
		graphOneHead = saveEDao.queryGraphOneHeadByRadio(radio);
		aGraphOne.setGraphOneHead(saveEDao.queryGraphOneHeadByRadio(radio));
		setGraphOneHead(graphOneHead);
        session.close();
        return aGraphOne;
	}
	
	public GraphTwo getGraphTwoListSQL(String radio,String age) throws Exception {//这里的参数需要改成radioLists
		GraphTwo aGraphTwo = new GraphTwo();
    	SqlSession session = Constants.getSqlSession();
		SaveEDao saveEDao = session.getMapper(SaveEDao.class);
		setSVTModel(saveEDao.queryGraphTwo(radio,age));//用这里的值创建出Map<String unit,List<GraphTwoModel>> 的结构画图
		aGraphTwo.setSVTModel(saveEDao.queryGraphTwo(radio,age));//新加0801n
		GraphTwoHead aGraphTwoHead = new GraphTwoHead();
		aGraphTwoHead = saveEDao.queryGraphTwoHeadByRadio(radio,age);
		aGraphTwo.setGraphTwoHead(saveEDao.queryGraphTwoHeadByRadio(radio,age));
		setGraphTwoHead(aGraphTwoHead);
        session.close();
        return aGraphTwo;
	}
	
    public List<GraphOne> getGraphOneListFunc(List<String> radioList) throws Exception {
    	List<GraphOne> graphOne = new ArrayList<GraphOne>();
    	for(String radio:radioList){
    		graphOne.add(getGraphOneListSQL(radio));   
    	}
    	setGraphOne(graphOne);
    	System.out.println("图一有图的个数："+graphOne.size());   	
    	for(GraphOne graphOneF : graphOne){
    		System.out.println(graphOneF.getGraphOneHead().getRadio()+graphOneF.getGraphOneHead().getUnit()+graphOneF.getGraphOneHead().getIfExceedSum());
    		for(GraphOneModel aGraphOneModel:graphOneF.getGraphOneModel()){
    			System.out.println("图一："+aGraphOneModel.getFoodType()+aGraphOneModel.getRadio()+aGraphOneModel.getContaver()+":"+aGraphOneModel.getLKJ());    			
    		}
    		System.out.println();
    	}
    	
		return graphOne;		
	}
    
    public List<GraphTwo> getGraphTwoListFunc(List<String> radioList,List<String> ageList) throws Exception {
    	List<GraphTwo> graphTwo = new ArrayList<GraphTwo>();
    	for(String radio:radioList){
    		for(String age:ageList)
    		{
    			graphTwo.add(getGraphTwoListSQL(radio,age));   
    		}
    	}
    	setGraphTwo(graphTwo);
    	System.out.println(graphTwo.size()+"个图二");
    	for(GraphTwo aGraphTwo : graphTwo){
    		//这里报错
    		System.out.println(aGraphTwo.getGraphTwoHead().getRadio()+aGraphTwo.getGraphTwoHead().getAge()+aGraphTwo.getGraphTwoHead().getSVTRA());
    		for(SVTModel sVTModel:aGraphTwo.getSVTModel()){
    			System.out.println("图二："+sVTModel.getFoodType()+sVTModel.getRadio()+":"+sVTModel.getSVT());    			
    		}
    		System.out.println();
    	}
		return graphTwo;		
	}
	
}