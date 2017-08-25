package com.dao;

import java.util.Collection;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.model.FoodConsume;
import com.model.FoodContent;
import com.model.FoodTypeModel;
import com.model.GraphOneHead;
import com.model.GraphOneModel;
import com.model.GraphTwoHead;
import com.model.OrganContent;
import com.model.OrganWt;
import com.model.Radio;
import com.model.SVTModel;
import com.model.SVTRAModel;
import com.model.SaveE;

public interface SaveEDao {
	public int insertE(SaveE sE) throws Exception;
	public Radio queryRadioByRadioName(String radio) throws Exception;
	public double queryContentByRadioFoodName(String radio,String foodName) throws Exception;
	public double queryFoodConsumeByFoodNameAge(String age,String foodName) throws Exception;
	public int updateRAE(SaveE sE) throws Exception;
	public SaveE queryRAE(String radio,String age) throws Exception;
	public List<SaveE> queryGetEByRadioFoodType(String radio,String foodType) throws Exception;
	public List<SaveE> queryGetEByAgeFoodType(String age,String foodType) throws Exception;
	public int updateFoodType(SaveE sE) throws Exception;
	public int updateSVT(SVTModel sE) throws Exception;
	public boolean clearRAE() throws Exception;
	public boolean clearSVT() throws Exception;
	public boolean clearSVTRA() throws Exception;
	public double queryLKJByRadioFoodType(String radio,String foodType) throws Exception;
	public SVTModel querySVT(String radio,String age,String foodType) throws Exception;
	public int insertSVTRA(SVTRAModel aSVTRA) throws Exception;
	public int alterIfExceedSum(String aRadio,double ifExceedSum);
	public int alterContaver(String aRadio,String foodType,double contaver);
	public List<String> queryFoodType() throws Exception;
	public List<GraphOneModel> queryGraphOne(String radio) throws Exception;
	public GraphOneHead queryGraphOneHeadByRadio(String radio) throws Exception;	
	public List<SVTModel> queryGraphTwo(String radio,String age) throws Exception;
	public GraphTwoHead queryGraphTwoHeadByRadio(String radio,String age) throws Exception;
	public List<String> queryFoodNameByFoodType(String foodType,String age) throws Exception;
	public String queryPSW(String managerName) throws Exception;
	
	public List<OrganWt> queryOrganWt() throws Exception;
	public List<OrganContent> queryOrganContent() throws Exception;
	public List<Radio> queryRadioList() throws Exception;
	public List<FoodContent> queryFoodContentList() throws Exception;
	public List<FoodConsume> queryFoodConsumeList() throws Exception;
	public List<GraphOneModel> queryLKJ() throws Exception;
	
	public int insertRAETable(@Param(value = "list")Collection<SaveE> tw) throws Exception;
	public int insertSVTTable(@Param(value = "list")Collection<SVTModel> tw) throws Exception;
	public boolean clearLKJTABLE() throws Exception;
	public int insertLKJTABLE(@Param(value = "list")Collection<GraphOneModel> tw) throws Exception;
	public boolean clearRA() throws Exception;
	public int insertRATABLE(@Param(value = "list")Collection<Radio> tw) throws Exception;
	public int insertSVTRATable(@Param(value = "list")Collection<SVTRAModel> tw) throws Exception;
	public List<String> queryAgeList() throws Exception;
	public List<FoodTypeModel> queryFoodTypeList() throws Exception;


	
}
