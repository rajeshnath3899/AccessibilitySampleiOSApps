//
//  SampleView.swift
//  DemoAccessibilityCALayer
//
//  Created by Rajeshnath Chyarngayil Vishwanath on 1/30/17.
//  Copyright © 2017 Rajeshnath Chyarngayil Vishwanath. All rights reserved.
//

import UIKit

fileprivate let ShadowRadius: CGFloat = 5.0
fileprivate let ShadowOpacity: Float = 0.8
fileprivate let LayerObject: String = "LayerObject"
fileprivate let LayerObjectLabel: String = "LayerObjectLabel"
fileprivate let layerSize: CGFloat = 100


class CustomView: UIView {
    
    var layerObjects:[[String:Any]] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        // Creating two Objects 'A' and 'B'
        createSquareObjectA()
        createSquareObjectB()
        
        // Adding accessibility to the Objects 'A' and 'B'
        
        addAccessiblityToObjects()
        
        
    }
    
    //compute min x
    private var viewMinX: CGFloat {
        
        return self.frame.minX
        
    }
    
    //compute max x
    
    private var viewMaxX: CGFloat {
        
        return self.frame.maxX
        
    }
    
    //compute view height
   private var viewHeight: CGFloat {
        
        return self.frame.height
        
    }

    
    
    
    /*Returing the first layer of current view */
    
    var firstLayer: CALayer {
        return self.layer
    }
    
    // Creating Object 'A'
    
    func createSquareObjectA() {
        
        var aLayer = CALayer()
        aLayer.backgroundColor = UIColor.blue.cgColor
        applyStylesOnLayer(layer: &aLayer)
        
        // No constarints used to position the objects
        
        aLayer.frame = CGRect(x: viewMinX + 50, y: viewHeight / 2 - layerSize / 2, width: layerSize, height: layerSize)
        
        let objectLabel: String = "A"
        addLabelTo(layer: aLayer, withText: objectLabel)
        firstLayer.addSublayer(aLayer)
        
        let layerObjectDictionary = [LayerObject:aLayer,LayerObjectLabel:objectLabel] as [String : Any]
        layerObjects.append(layerObjectDictionary)
    }
    
    // Creating Object 'B'
    
    func createSquareObjectB() {
        
        var bLayer = CALayer()
        bLayer.backgroundColor = UIColor.red.cgColor
        applyStylesOnLayer(layer: &bLayer)
        
        // No constarints used to position the objects

        bLayer.frame = CGRect(x: viewMaxX - 150, y: viewHeight / 2 - layerSize / 2, width: layerSize, height: layerSize)
        
        let objectLabel: String = "B"
        addLabelTo(layer: bLayer, withText: objectLabel)
        firstLayer.addSublayer(bLayer)
        
        let layerObjectDictionary = [LayerObject:bLayer,LayerObjectLabel:objectLabel] as [String : Any]
        layerObjects.append(layerObjectDictionary)
    }
    
    /* Applying styles to the objects */
    
    func applyStylesOnLayer(layer: inout CALayer) {
        
        layer.shadowRadius = ShadowRadius
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = ShadowOpacity
    }
    
    
    /* Adding text label to the Objects */
    
    func addLabelTo(layer: CALayer, withText text:String) {
        let label: CATextLayer = CATextLayer()
        
        label.font = "Helvetica-Bold" as CFTypeRef? 
        label.fontSize = 30
        
        label.frame = layer.bounds
        label.frame.origin.y = (layer.frame.height - label.fontSize) / 2 - label.fontSize / 10
        
        label.string = text
        label.alignmentMode = kCAAlignmentCenter
        label.foregroundColor = UIColor.white.cgColor
        layer.addSublayer(label)
        
    }
    
    /* Making the objects Accessible */
    
    func addAccessiblityToObjects() {
        
        self.accessibilityElements = []
        for layerItem:[String:Any] in layerObjects {
            let layerObject: CALayer = layerItem[LayerObject] as! CALayer
            let layerObjectLabel: String = layerItem[LayerObjectLabel] as! String
            
            let layerAcessibilityElement = UIAccessibilityElement(accessibilityContainer: self)
            layerAcessibilityElement.accessibilityFrame = UIAccessibilityConvertFrameToScreenCoordinates(layerObject.frame, self)
            layerAcessibilityElement.accessibilityLabel = layerObjectLabel
            self.accessibilityElements?.append(layerAcessibilityElement)
        }
        
        
    }
    
}
