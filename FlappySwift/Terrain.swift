//
//  Terrain.swift
//  FlappySwift
//
//  Created by Giordano Scalzo on 03/06/2014.
//  Copyright (c) 2014 Effective Code. All rights reserved.
//

import SpriteKit

class Terrain {
    private var parallaxNode: ParallaxNode!
    
    init() {
    }
    
    func addTo(parentNode: SKScene!) -> Terrain {
        
        let width = parentNode.size.width
        let height = CGFloat(60.0)
        
        parallaxNode = ParallaxNode(width: width,
                              height: height,
                        textureNamed: "terrain.png").zPosition(5).addTo(parentNode)
        
        let terrainBody = SKNode()
        terrainBody.position = CGPoint(x: width/2.0, y: height/2)
        
        terrainBody.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: width, height: height))
        terrainBody.physicsBody!.dynamic = false
        terrainBody.physicsBody!.affectedByGravity = false
        terrainBody.physicsBody!.collisionBitMask = BodyType.bird.toRaw()
        terrainBody.physicsBody!.categoryBitMask = BodyType.world.toRaw()
        terrainBody.physicsBody!.contactTestBitMask = BodyType.bird.toRaw()
        parentNode.addChild(terrainBody)
        return self
    }
    
    func start() {
        parallaxNode.start(duration: 5.0)
    }
}
