package main

import (
	docs "horaoen/furever/docs"

	"github.com/gin-gonic/gin"

	swaggerfiles "github.com/swaggo/files"

	ginSwagger "github.com/swaggo/gin-swagger"
)

// gin-swagger middleware
// swagger embed files

// @BasePath /api/v1

// PingExample godoc
// @Summary ping example
// @Schemes
// @Description do ping
// @Tags example
// @Accept json
// @Produce json
// @Success 200 {string} pong
// @Router /ping [get]
func main() {
	router := gin.Default()
	docs.SwaggerInfo.BasePath = "/"
	router.GET("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "pong",
		})
	})
	router.GET("/swagger/*any", ginSwagger.WrapHandler(swaggerfiles.Handler))
	if err := router.Run(); err != nil {
		panic(err)
	}
}
