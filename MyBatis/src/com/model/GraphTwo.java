package com.model;

import java.util.List;

public class GraphTwo {
    
    private GraphTwoHead graphTwoHead;
    private List<SVTModel> sVTModel;
    
    public GraphTwoHead getGraphTwoHead() {
        return graphTwoHead;
    }
    public void setGraphTwoHead(GraphTwoHead graphTwoHead) {
        this.graphTwoHead = graphTwoHead;
    }
    public List<SVTModel> getSVTModel() {
        return sVTModel;
    }
    public void setSVTModel(List<SVTModel> sVTModel) {
        this.sVTModel = sVTModel;
    }
}