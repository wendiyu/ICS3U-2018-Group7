
// Created on: Dec-2018
// Created by: Wendi Yu
// Created for: ICS3U
// This program is the template for the ICS3U final project
// this will be commented out when code moved to Xcode
import PlaygroundSupport


import SpriteKit

class GameScene: SKScene {
    // local variables to this scene
    let splashSceneBackground = SKSpriteNode(imageNamed: "splashSceneImage.png")
    let moveToNextSceneDelay = SKAction.wait(forDuration: 3.0)
    
    
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        let soundOff : Bool = false
        UserDefaults().set(soundOff, forKey: "sounds off")
        
        /* Setup your scene here */
        self.backgroundColor = SKColor(red: 0.0, green:0.0, blue:0.0, alpha: 1.0)
        
        splashSceneBackground.name = "splash Scene Background"
        splashSceneBackground.position = CGPoint(x: frame.midX, y: frame.midY)
        splashSceneBackground.size = CGSize(width: frame.size.width, height: frame.size.height)
        self.addChild(splashSceneBackground)
        
        splashSceneBackground.run(moveToNextSceneDelay) {
            //run code here after 3 secs
            
            self.splashSceneBackground.removeAllActions()
            let logoScene = LogoScene(size: self.size)
            self.view?.presentScene(logoScene)
        }
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //when the screen is touched, it moves to the main menu
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
    }
}

class LogoScene: SKScene, SKPhysicsContactDelegate {
    // local variables to this scene
    let logo = SKSpriteNode(imageNamed: "logo.jpg")
    let moveToNextSceneDelay = SKAction.wait(forDuration: 2.0)
    
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        /* Setup your scene here */
        
        self.backgroundColor = SKColor(red: 1.0, green: 1.0, blue:1.0, alpha: 1.0)
        logo.position = CGPoint(x: frame.midX, y: frame.midY)
        logo.size = CGSize(width: frame.size.width, height: frame.size.height)
        logo.name = "Game name"
        self.addChild(logo)
        
        logo.run(moveToNextSceneDelay) {
            //run code here after 3 secs
            
            self.logo.removeAllActions()
            let mainMenuScene = MainMenuScene(size: self.size)
            self.view!.presentScene(mainMenuScene)
        }
        
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // when the start button is touched, it moves to the main game
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
        
    }
}

class MainMenuScene: SKScene, SKPhysicsContactDelegate {
    // local variables to this scene
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        let backgroundImage = SKSpriteNode(imageNamed: "mainMenuBackground.jpg")
        let startButton = SKSpriteNode(imageNamed: "startButton.jpg")
        let helpButton = SKSpriteNode(imageNamed: "helpButton.jpg")
        let creditButton = SKSpriteNode(imageNamed: "creditButton.jpg")
        let settingButton = SKSpriteNode(imageNamed: "settingButton.png")
        
        
        /* Setup your scene here */
        
        backgroundImage.position = CGPoint(x: frame.midX, y: frame.midY)
        backgroundImage.size = CGSize(width: frame.size.width, height: frame.size.height)
        backgroundImage.name = "menu background"
        self.addChild(backgroundImage)
        
        startButton.position = CGPoint(x: (frame.size.width / 5.5) , y: (frame.size.height / 1.5))
        startButton.name = "start button"
        self.addChild(startButton)
        startButton.setScale(0.65)
        startButton.zPosition = 1.0
        
        helpButton.position = CGPoint(x: (frame.size.width / 5.5) , y: (frame.size.height / 2.25))
        helpButton.name = "help button"
        self.addChild(helpButton)
        helpButton.setScale(0.65)
        helpButton.zPosition = 2.0
        
        creditButton.position = CGPoint(x: (frame.size.width / 5.5) , y: (frame.size.height / 4.5))
        creditButton.name = "credit button"
        self.addChild(creditButton)
        creditButton.setScale(0.65)
        creditButton.zPosition = 3.0
        
        settingButton.position = CGPoint(x: (frame.size.width / 2.8) , y:   (frame.size.height / 4.5))
        settingButton.name = "setting button"
        self.addChild(settingButton)
        settingButton.setScale(0.65)
        settingButton.zPosition = 4.0
        
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // when the start button is touched, it moves to the main game
        
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var touchedNode = self.atPoint(location)
        
        // click button to go to different scene 
        
        if let touchedNodeName = touchedNode.name {
            if touchedNodeName == "setting button" {
                
                let soundScene = SoundScene(size: self.size)
                self.view!.presentScene(soundScene)
            }
            else if touchedNodeName == "help button" {
                
                let helpScene = HelpScene(size: self.size)
                self.view!.presentScene(helpScene)
            }
            else if touchedNodeName == "credit button" {
                
                let creditScene = CreditScene(size: self.size)
                self.view!.presentScene(creditScene)
                
            }
            else if touchedNodeName == "start button" {
                
                let mainGameScene = MainGameScene(size: self.size)
                self.view!.presentScene(mainGameScene)
                
            }
            
        }
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
        
    }
}

class SoundScene: SKScene {
    // local variables to this scene
    let soundBackground = SKSpriteNode(imageNamed: "backgroundImage.png")
    let backgroundSound = SKAudioNode(fileNamed: "BackgroundMusic.mp3")
    let goBackButton = SKSpriteNode(imageNamed: "goBack.png")
    let soundOnButton = SKSpriteNode(imageNamed: "soundButton.png")
    let soundOffButton = SKSpriteNode(imageNamed: "soundOffButton.jpg")
    let soundLabel = SKLabelNode(fontNamed: "SavoyeLetPlain")
    
    var sound : Bool = false
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        
        /* Setup your scene here */
        
        soundBackground.name = "Background"
        soundBackground.position = CGPoint(x: frame.midX, y: frame.midY)
        soundBackground.size = CGSize(width: frame.size.width, height: frame.size.height)
        self.addChild(soundBackground)
        
        soundLabel.text = "Sound: "
        soundLabel.fontColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        soundLabel.fontSize = 90
        soundLabel.position = CGPoint(x: frame.size.width - 700 , y: (frame.size.height / 2))
        soundLabel.zPosition = 1.0
        self.addChild(soundLabel)
        
        goBackButton.position = CGPoint(x: frame.size.width - 890 , y: frame.size.height - 50)
        goBackButton.name = "goBack button"
        self.addChild(goBackButton)
        goBackButton.setScale(0.65)
        goBackButton.zPosition = 2.0
        
        soundOnButton.position = CGPoint(x: frame.size.width - 500 , y: frame.size.height / 2)
        soundOnButton.name = "sound button"
        self.addChild(soundOnButton)
        soundOnButton.setScale(0.70)
        soundOnButton.zPosition = 3.0
        
        soundOffButton.position = CGPoint(x: frame.size.width - 300 , y: frame.size.height / 2)
        soundOffButton.name = "sound off button"
        self.addChild(soundOffButton)
        soundOffButton.setScale(0.70)
        soundOffButton.zPosition = 4.0
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //when the screen is touched, it moves to the main menu
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var touchedNode = self.atPoint(location)
        
        if let touchedNodeName = touchedNode.name {
            if touchedNodeName == "goBack button" {
                let mainMenuScene = MainMenuScene(size: self.size)
                self.view!.presentScene(mainMenuScene)
            }
            else if touchedNodeName == "sound off button" {
                if sound == false {
                    UserDefaults().set(sound, forKey: "sounds off")
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
    }
}

class HelpScene: SKScene {
    // local variables to this scene
    let helpBackground = SKSpriteNode(imageNamed: "helpCenter.png")
    let goBackButton = SKSpriteNode(imageNamed: "goBack.png")
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        /* Setup your scene here */
        
        helpBackground.name = "Background"
        helpBackground.position = CGPoint(x: frame.midX, y: frame.midY)
        helpBackground.size = CGSize(width: frame.size.width, height: frame.size.height)
        self.addChild(helpBackground)
        
            // add button for go back to main menu scene 
        goBackButton.position = CGPoint(x: frame.size.width - 890 , y: frame.size.height - 50)
        goBackButton.name = "goBack button"
        self.addChild(goBackButton)
        goBackButton.setScale(0.65)
        goBackButton.zPosition = 1.0
            
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //when the screen is touched, it moves to the main menu
        
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var touchedNode = self.atPoint(location)
        
        // back to menu scene action 
        if let touchedNodeName = touchedNode.name {
            if touchedNodeName == "goBack button" {
                let mainMenuScene = MainMenuScene(size: self.size)
                self.view!.presentScene(mainMenuScene)
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
    }
}

class CreditScene: SKScene {
    // local variables to this scene
    let creditBackground = SKSpriteNode(imageNamed: "creditImage.png")
    let goBackButton = SKSpriteNode(imageNamed: "goBack.png")
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        /* Setup your scene here */
        
        creditBackground.name = "Background"
        creditBackground.position = CGPoint(x: frame.midX, y: frame.midY)
        creditBackground.size = CGSize(width: frame.size.width, height: frame.size.height)
        self.addChild(creditBackground)
        
        // add button for go back to main menu scene 
        goBackButton.position = CGPoint(x: frame.size.width - 890 , y: frame.size.height - 50)
        goBackButton.name = "goBack button"
        self.addChild(goBackButton)
        goBackButton.setScale(0.65)
        goBackButton.zPosition = 1.0
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //when the screen is touched, it moves to the main menu
        
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var touchedNode = self.atPoint(location)
        
        // back to menu scene action
        if let touchedNodeName = touchedNode.name {
            if touchedNodeName == "goBack button" {
                let mainMenuScene = MainMenuScene(size: self.size)
                self.view!.presentScene(mainMenuScene)
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
    }
}

class MainGameScene: SKScene, SKPhysicsContactDelegate {
    // local variables to this scene
    let mainGameBackground = SKSpriteNode(imageNamed: "backgroundImage.png")
    
    //https://www.fesliyanstudios.com/royalty-free-music/download/8-bit-menu/287
    let backgroundSound = SKAudioNode(fileNamed: "BackgroundMusic.mp3")
    
    let rabbit = SKSpriteNode(imageNamed: "rabbit.png")
    let rightButton = SKSpriteNode(imageNamed: "rightButton.png")
    let leftButton = SKSpriteNode(imageNamed: "leftButton.png")
    let goBackButton = SKSpriteNode(imageNamed: "goBack.png")
    let scoreLabel = SKLabelNode(fontNamed: "SavoyeLetPlain")
    
    var score : Int = 0
    var currentRabbit = true
    
    var foods = [SKSpriteNode]()
    var foodAttackRate: Double = 1
    
    var leftButtonClicked = false
    var rightButtonClicked = false
    
        // for collision detection
    let collisionFoodCategory: UInt32 = 1
    let collisionRabbitCategory: UInt32 = 2
    
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        self.physicsWorld.contactDelegate = self 
        
        /* Setup your scene here */
        self.addChild(backgroundSound)
        
        mainGameBackground.name = "game Background"
        mainGameBackground.position = CGPoint(x: frame.midX, y: frame.midY)
        mainGameBackground.size = CGSize(width: frame.size.width, height: frame.size.height)
        self.addChild(mainGameBackground)
        
        scoreLabel.text = "Score: 0" 
        scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        scoreLabel.fontColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        scoreLabel.fontSize = 30
        scoreLabel.position = CGPoint(x: 800, y: frame.size.height - 50)
        self.addChild(scoreLabel)
        scoreLabel.zPosition = 1.0
        
        rabbit.position = CGPoint(x: (frame.size.width / 2) , y: 100)
        rabbit.name = "rabbit"
        rabbit.physicsBody?.isDynamic = true
        rabbit.physicsBody = SKPhysicsBody(texture: rabbit.texture!, size: rabbit.size)
        rabbit.physicsBody?.affectedByGravity = false
        rabbit.physicsBody?.usesPreciseCollisionDetection = true
        rabbit.physicsBody?.categoryBitMask = collisionRabbitCategory
        rabbit.physicsBody?.collisionBitMask = 0x0
        self.addChild(rabbit)
        rabbit.setScale(0.15)
        rabbit.zPosition = 2.0
        
        leftButton.position = CGPoint(x: 100, y: 100)
        leftButton.name = "left button"
        leftButton.alpha = 0.5
        self.addChild(leftButton)
        leftButton.setScale(0.65)
        leftButton.zPosition = 3.0
        
        rightButton.position = CGPoint(x: (frame.size.width / 1.1), y: 100)
        rightButton.name = "right button"
        rightButton.alpha = 0.5
        self.addChild(rightButton)
        rightButton.setScale(0.65)
        rightButton.zPosition = 4.0
        
        goBackButton.position = CGPoint(x: frame.size.width - 890 , y: frame.size.height - 50)
        goBackButton.name = "goBack button"
        self.addChild(goBackButton)
        goBackButton.setScale(0.65)
        goBackButton.zPosition = 5.0
        
        backgroundSound.run(SKAction.play())
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
        if rightButtonClicked == true {
            
            if currentRabbit == true && rabbit.position.x <= (frame.size.width){
                // move ship to right 
                var moveRabbitRight = SKAction.moveBy(x: 10, y: 0, duration: 0.1)
                rabbit.run(moveRabbitRight)
            }
        } 
        else if leftButtonClicked == true && rabbit.position.x >= 0 {
            if currentRabbit == true  {
                // move ship to left 
                var moveRabitLeft = SKAction.moveBy(x: -10, y: 0, duration: 0.1)
                rabbit.run(moveRabitLeft)
            }
        }
        
        // create food at random spot
        let spawnFoodChance = Int(arc4random_uniform(100) + 1 )
        if spawnFoodChance <= Int(foodAttackRate) {
            spawnFood()
        }
        
        // food remove from sence
        for aSingleFood in foods {
            if aSingleFood.position.y < -50 {
                aSingleFood.position.x = -500
                aSingleFood.position.y = 5000
                aSingleFood.removeFromParent()
                foods.removeFirst()
                
                // Score never be negative and if rabbit miss a pizza, the score would go down 2 points 
                
                if currentRabbit == true {
                    score -= 2
                    if score < 0 {
                        score = 0
                    }
                    
                    scoreLabel.text = "Score: " + String(score)
                }
            }
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        // check if contact occured
        let secondNode = contact.bodyB.node as! SKSpriteNode
        
        if ((contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask) == (collisionFoodCategory | collisionRabbitCategory)) {
            
            // add sound effect on rabbit
            //http://opengameart.org/users/varkalandar
            rabbit.run(SKAction.playSoundFileNamed("Coin.wav", waitForCompletion: false))
            contact.bodyB.node?.removeFromParent()
            
            // update score
            score += 1
            scoreLabel.text = "Score: " + String(score)
            
            // when score lager than 100, move to the end scene 
            if score > 100 {
                
                //remove rabbit off the scene 
                currentRabbit == false
                
                let moveToNextSceneDelay = SKAction.wait(forDuration: 2.0)
                
                // run code after 2s
                mainGameBackground.run(moveToNextSceneDelay) {
                    
                    self.mainGameBackground.removeAllActions()
                    let endScene = EndScene(size: self.size)
                    self.view!.presentScene(endScene)
                }
            }
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //when the screen is touched, it moves to the main menu
        
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var touchedNode = self.atPoint(location)
        
        if let touchedNodeName = touchedNode.name{
            if touchedNodeName == "right button" {
                rightButtonClicked = true 
            } 
            else if touchedNodeName == "left button" {
                leftButtonClicked = true
            }
            else if touchedNodeName == "goBack button" {
                let mainMenuScene = MainMenuScene(size: self.size)
                self.view!.presentScene(mainMenuScene)
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var touchedNode = self.atPoint(location)
        
        if let touchedNodeName = touchedNode.name {
            if touchedNodeName == "right button" {
                rightButtonClicked = false
            }
            else if touchedNodeName == "left button" {
                leftButtonClicked = false
            }
        }
    }
    
    class EndScene: SKScene {
        // local variables to this scene
        let endBackground = SKSpriteNode(imageNamed: "endingImage.jpg")
        let goBackButton = SKSpriteNode(imageNamed: "goBack.png")
        let retryButton = SKSpriteNode(imageNamed: "retryButton.jpg")
        
        override func didMove(to view: SKView) {
            // this is run when the scene loads
            
            /* Setup your scene here */
            self.backgroundColor = SKColor(red: 0.0, green:0.0, blue:0.0, alpha: 1.0)
            
            endBackground.name = "end Scene Background"
            endBackground.position = CGPoint(x: frame.midX, y: frame.midY)
            endBackground.size = CGSize(width: frame.size.width, height: frame.size.height)
            self.addChild(endBackground)
            
            goBackButton.position = CGPoint(x: frame.size.width - 890 , y: frame.size.height - 50)
            goBackButton.name = "goBack button"
            self.addChild(goBackButton)
            goBackButton.setScale(0.65)
            goBackButton.zPosition = 1.0
            
                //retry game button, back to game scene 
            retryButton.position = CGPoint(x: frame.size.width - 250 , y: frame.size.height - 400 )
            retryButton.name = "retry button"
            self.addChild(retryButton)
            retryButton.setScale(0.65)
            retryButton.zPosition = 2.0
        }
        
        override func  update(_ currentTime: TimeInterval) {
            //
            
        }
        
        func didBegin(_ contact: SKPhysicsContact) {
            //
            
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            //when the screen is touched, it moves to the main menu
            
            var touch = touches as! Set<UITouch>
            var location = touch.first!.location(in: self)
            var touchedNode = self.atPoint(location)
            
            if let touchedNodeName = touchedNode.name {
                if touchedNodeName == "goBack button" {
                    let mainMenuScene = MainMenuScene(size: self.size)
                    self.view!.presentScene(mainMenuScene)
                }
                else if touchedNodeName == "retry button" {
                    let mainGameScene = MainGameScene(size: self.size)
                    self.view!.presentScene(mainGameScene)
                }
            }
        }
        
        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            //
            
            
        }
        
        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            //
        }
    }

    func spawnFood() {
        let aSingleFood = SKSpriteNode(imageNamed: "pizza.png")
        let foodStartPostitionX = Int(arc4random_uniform(UInt32(screenSize.width)))
        let foodEndPostitionX = Int(arc4random_uniform(UInt32(screenSize.width)))
        aSingleFood.position = CGPoint(x: foodStartPostitionX, y: Int(screenSize.height) + 100)
        aSingleFood.zPosition = 6.0
        let foodMove = SKAction.move(to: CGPoint(x: foodEndPostitionX, y: -100), duration: TimeInterval(4 - (foodAttackRate / 6 )))
        aSingleFood.run(foodMove)
        aSingleFood.physicsBody?.isDynamic = true
        aSingleFood.physicsBody = SKPhysicsBody(texture: rabbit.texture!, size: rabbit.size)
        aSingleFood.physicsBody?.affectedByGravity = false
        aSingleFood.physicsBody?.usesPreciseCollisionDetection = true
        aSingleFood.physicsBody?.categoryBitMask = collisionFoodCategory
        aSingleFood.physicsBody?.contactTestBitMask = collisionRabbitCategory
        aSingleFood.physicsBody?.collisionBitMask = 0x0
        self.addChild(aSingleFood)
        aSingleFood.setScale(1.5)
        foods.append(aSingleFood)
        
    }
}
        
        
        
    


// this will be commented out when code moved to Xcode

// set the frame to be the size for your iPad

let screenSize = UIScreen.main.bounds
let screenWidth = screenSize.width
let screenHeight = screenSize.height
let frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)

let scene = GameScene(size: frame.size)
scene.scaleMode = SKSceneScaleMode.resizeFill

let skView = SKView(frame: frame)
skView.showsFPS = true
skView.showsNodeCount = true
skView.presentScene(scene)

PlaygroundPage.current.liveView = skView
