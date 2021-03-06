class World
    constructor: (@stage) ->

    setup: ->
        # Shore
        @stage.addChild @setPosition 4, 0, @animatedTexture "A24", "K24"
        @stage.addChild @setPosition 0, 1, @animatedTexture "A23", "K23"
        @stage.addChild @setPosition 1, 1, @animatedTexture "B23", "L23"
        @stage.addChild @setPosition 2, 1, @animatedTexture "B23", "L23"
        @stage.addChild @setPosition 3, 1, @animatedTexture "B23", "L23"
        @stage.addChild @setPosition 4, 1, @animatedTexture "I25", "S25"
        @stage.addChild @setPosition 0, 2, @animatedTexture "A24", "K24"
        @stage.addChild @setPosition 0, 3, @animatedTexture "A27", "K27"
        @stage.addChild @setPosition 1, 3, @animatedTexture "E25", "O25"
        @stage.addChild @setPosition 2, 3, @animatedTexture "I20", "S20"
        @stage.addChild @setPosition 2, 4, @animatedTexture "D25", "N25"
        @stage.addChild @setPosition 3, 4, @animatedTexture "E25", "O25"
        @stage.addChild @setPosition 4, 4, @animatedTexture "E25", "O25"
        @stage.addChild @setPosition 5, 4, @animatedTexture "E25", "O25"
        # Water
        @stage.addChild @setPosition 5, 0, @animatedTexture "D22", "N22"
        @stage.addChild @setPosition 5, 1, @animatedTexture "D22", "N22"
        @stage.addChild @setPosition 1, 2, @animatedTexture "D22", "N22"
        @stage.addChild @setPosition 2, 2, @animatedTexture "D22", "N22"
        @stage.addChild @setPosition 3, 2, @animatedTexture "D22", "N22"
        @stage.addChild @setPosition 4, 2, @animatedTexture "D22", "N22"
        @stage.addChild @setPosition 5, 2, @animatedTexture "D22", "N22"
        @stage.addChild @setPosition 3, 3, @animatedTexture "D22", "N22"
        @stage.addChild @setPosition 4, 3, @animatedTexture "D22", "N22"
        @stage.addChild @setPosition 5, 3, @animatedTexture "D22", "N22"
        # Grass
        @stage.addChild @setPosition 0, 0, @texture "B03"
        @stage.addChild @setPosition 1, 0, @texture "B03"
        @stage.addChild @setPosition 2, 0, @texture "B03"
        @stage.addChild @setPosition 3, 0, @texture "B03"
        @stage.addChild @setPosition 0, 6, @texture "B03"
        @stage.addChild @setPosition 1, 6, @texture "B03"
        @stage.addChild @setPosition 2, 6, @texture "B03"
        @stage.addChild @setPosition 3, 6, @texture "B03"
        @stage.addChild @setPosition 4, 6, @texture "B03"
        @stage.addChild @setPosition 5, 6, @texture "B03"
        # Sand Grass
        @stage.addChild @setPosition 5, 5, @texture "E08"
        @stage.addChild @setPosition 4, 5, @texture "E08"
        @stage.addChild @setPosition 3, 5, @texture "E08"
        @stage.addChild @setPosition 2, 5, @texture "E08"
        @stage.addChild @setPosition 1, 5, @texture "E08"
        @stage.addChild @setPosition 0, 5, @texture "D08"
        @stage.addChild @setPosition 0, 4, @texture "D07"
        # Sand
        @stage.addChild @setPosition 1, 4, @texture "E07"

    setPosition: (x, y, texture) ->
        texture.position.x = x * 32
        texture.position.y = y * 32
        texture

    animatedTexture: (texture1, texture2) ->
        frame1 = PIXI.Sprite.fromFrame(texture1).texture
        frame2 = PIXI.Sprite.fromFrame(texture2).texture
        texture = new PIXI.MovieClip [frame1, frame2]
        texture.gotoAndPlay 0
        texture.animationSpeed = .1
        texture

    texture: (texture) ->
        PIXI.Sprite.fromFrame texture

    update: ->