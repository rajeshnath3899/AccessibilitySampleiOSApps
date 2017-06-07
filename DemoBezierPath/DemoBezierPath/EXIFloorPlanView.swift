//
//  EXIFloorPlanView.swift
//  DemoBezierPath
//
//  Created by Rajeshnath Chyarngayil Vishwanath on 1/30/17.
//  Copyright © 2017 Rajeshnath Chyarngayil Vishwanath. All rights reserved.
//

import UIKit


fileprivate let kLineWidth: CGFloat = 2.0
fileprivate let kFontSize: CGFloat = 16.0
fileprivate let kStrokeColor: UIColor =  UIColor.blue

fileprivate let FloorPlanBezierPath: String = "FloorPlanBezierPath"
fileprivate let FloorPlanString: String = "FloorPlanString"

class EXIFloorPlanView: UIView {
    
    var floorPlanFeatures: [[String:Any]] = []
    
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
        
        drawEntrance() //Draw's the entrance
        drawGroundFloorSpace() //Draw's Ground floor space
        drawConferenceRoomOne() //Draw's conference room one
        drawConferenceRoomTwo() //Draw's conference room two
        drawPantryFloorSpace() // Draw's Pantry
        addAccessibility() // Apply accessibility on objects drawn
        
    }
    
    var viewHeight: CGFloat {
        
        return self.frame.size.height
        
    }
    
    var viewWidth: CGFloat {
        
        return self.frame.size.width
        
    }
    
    struct PathComponent {
        
        var bezierPath = UIBezierPath()
        let bezierLineWidth: CGFloat
        let strokeColor: UIColor
        
        init(bezierLineWidth: CGFloat, strokeColor: UIColor) {
            
            self.bezierLineWidth = bezierLineWidth
            self.strokeColor = strokeColor
            
        }
        
        
    }
    
    
    //Draw ground floor space
    
    func drawGroundFloorSpace() {
        
        let groundFloor = PathComponent(bezierLineWidth: kLineWidth, strokeColor: kStrokeColor)
        var groundFloorSpaceBezierPath = groundFloor.bezierPath
        
        groundFloorSpaceBezierPath.move(to: CGPoint(x: 40, y: 70))
        groundFloorSpaceBezierPath.addLine(to: CGPoint(x: viewWidth-40, y: 70))
        groundFloorSpaceBezierPath.addLine(to: CGPoint(x: viewWidth-40, y: viewHeight-70))
        groundFloorSpaceBezierPath.addLine(to: CGPoint(x: 40.0, y: viewHeight-70))
        groundFloorSpaceBezierPath.close()
        
        groundFloor.strokeColor.setStroke()
        groundFloorSpaceBezierPath.stroke()
        
        let floorName: String = "Ground Floor"
        
        addAttributedStringFor(bezierPath: &groundFloorSpaceBezierPath, withString: floorName)
        
        let floorPlanFeature = [FloorPlanBezierPath:groundFloorSpaceBezierPath,FloorPlanString:floorName] as [String : Any]
        floorPlanFeatures.append(floorPlanFeature)
        
    }
    
    //Draw Pantry floor space
    
    func drawPantryFloorSpace() {
        
        let pantry = PathComponent(bezierLineWidth: kLineWidth, strokeColor: kStrokeColor)
        var pantryBezierPath = pantry.bezierPath
        
        pantryBezierPath.move(to: CGPoint(x: viewWidth-40, y: viewHeight-130))
        pantryBezierPath.addLine(to: CGPoint(x: viewWidth-180, y: viewHeight-130))
        pantryBezierPath.addLine(to: CGPoint(x: viewWidth-180, y: viewHeight-70))
        pantryBezierPath.addLine(to: CGPoint(x: viewWidth-40, y: viewHeight-70))
        pantryBezierPath.close()
        
        pantry.strokeColor.setStroke()
        pantryBezierPath.stroke()
        
        let floorName: String = "Pantry"
        addAttributedStringFor(bezierPath: &pantryBezierPath, withString: floorName)
        
        let floorPlanFeature = [FloorPlanBezierPath:pantryBezierPath,FloorPlanString:floorName] as [String : Any]
        floorPlanFeatures.append(floorPlanFeature)
        
    }
    
    // Draw entrance
    
    func drawEntrance() {
        
        let entrance = PathComponent(bezierLineWidth: kLineWidth, strokeColor: kStrokeColor)
        var entranceBezierPath = entrance.bezierPath
        
        entranceBezierPath.move(to: CGPoint(x: viewWidth/2-50 , y: 70.0))
        entranceBezierPath.addLine(to: CGPoint(x: viewWidth/2-50, y: 30.0))
        entranceBezierPath.addLine(to: CGPoint(x: viewWidth/2+50, y: 30.0))
        entranceBezierPath.addLine(to: CGPoint(x: viewWidth/2+50, y: 70.0))
        entranceBezierPath.close()
        entrance.strokeColor.setStroke()
        entranceBezierPath.stroke()
        
        let floorName: String = "Entrance"
        addAttributedStringFor(bezierPath: &entranceBezierPath, withString: floorName)
        
        let floorPlanFeature = [FloorPlanBezierPath:entranceBezierPath,FloorPlanString:floorName] as [String : Any]
        floorPlanFeatures.append(floorPlanFeature)
        
    }
    
    
    // Draw Conference room one
    
    func drawConferenceRoomOne() {
        
        let confRoomOne = PathComponent(bezierLineWidth: kLineWidth, strokeColor: kStrokeColor)
        var confRoomOneBezierPath = confRoomOne.bezierPath
        
        confRoomOneBezierPath.move(to: CGPoint(x: 40, y: 70.0))
        confRoomOneBezierPath.addLine(to: CGPoint(x: 40, y: 130))
        confRoomOneBezierPath.addLine(to: CGPoint(x: viewWidth/2-80, y: 130))
        confRoomOneBezierPath.addLine(to: CGPoint(x:  viewWidth/2-80, y: 70))
        confRoomOneBezierPath.close()
        confRoomOne.strokeColor.setStroke()
        confRoomOneBezierPath.stroke()
        
        let floorName: String = "Conference Room One"
        addAttributedStringFor(bezierPath: &confRoomOneBezierPath, withString: floorName)
        
        let floorPlanFeature = [FloorPlanBezierPath:confRoomOneBezierPath,FloorPlanString:floorName] as [String : Any]
        floorPlanFeatures.append(floorPlanFeature)
        
    }
    
    // Draw Conference room two
    
    func drawConferenceRoomTwo() {
        
        let confRoomTwo = PathComponent(bezierLineWidth: kLineWidth, strokeColor: kStrokeColor)
        var confRoomTwoBezierPath = confRoomTwo.bezierPath
        
        confRoomTwoBezierPath.move(to: CGPoint(x: 40, y: viewHeight-70))
        confRoomTwoBezierPath.addLine(to: CGPoint(x: 40, y: viewHeight-130))
        confRoomTwoBezierPath.addLine(to: CGPoint(x:  viewWidth/2-80, y: viewHeight-130))
        confRoomTwoBezierPath.addLine(to: CGPoint(x:  viewWidth/2-80, y: viewHeight-70))
        confRoomTwoBezierPath.close()
        confRoomTwo.strokeColor.setStroke()
        confRoomTwoBezierPath.stroke()
        
        let floorName: String = "Conference Room Two"
        addAttributedStringFor(bezierPath: &confRoomTwoBezierPath, withString: floorName)
        
        let floorPlanFeature = [FloorPlanBezierPath:confRoomTwoBezierPath,FloorPlanString:floorName] as [String : Any]
        floorPlanFeatures.append(floorPlanFeature)
        
    }
    
    
    
    // Add attributed strings to the Bezier paths drawn
    
    func addAttributedStringFor(bezierPath: inout UIBezierPath , withString stringValue :String) {
        
        let floorPlanFeatureAttributedString = NSAttributedString(string: stringValue, attributes: [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 13.0),NSForegroundColorAttributeName: UIColor.black])
        
        floorPlanFeatureAttributedString.draw(at:
            CGPoint(x: bezierPath.bounds.midX-floorPlanFeatureAttributedString.size().width * 0.5, y: bezierPath.bounds.midY-floorPlanFeatureAttributedString.size().height * 0.5))
    }
    
    // Adding accessibility to the bezier path elements
    
    func addAccessibility() {
        
        self.accessibilityElements = []
        
        for element in floorPlanFeatures {
            
            let acessibilityElement = UIAccessibilityElement(accessibilityContainer: self)
            acessibilityElement.accessibilityPath = UIAccessibilityConvertPathToScreenCoordinates(element[FloorPlanBezierPath] as! UIBezierPath, self)
            acessibilityElement.accessibilityLabel = element[FloorPlanString] as! String?
            self.accessibilityElements?.append(acessibilityElement)
            
            
            
        }
        
        
    }
    
    
}
