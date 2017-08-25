package com.model;

import java.util.List;

public class GraphOne {
    
    private GraphOneHead graphOneHead;
    private List<GraphOneModel> graphOneModel;
    
    public GraphOneHead getGraphOneHead() {
        return graphOneHead;
    }
    public void setGraphOneHead(GraphOneHead graphOneHead) {
        this.graphOneHead = graphOneHead;
    }
    public List<GraphOneModel> getGraphOneModel() {
        return graphOneModel;
    }
    public void setGraphOneModel(List<GraphOneModel> graphOneModel) {
        this.graphOneModel = graphOneModel;
    }
}