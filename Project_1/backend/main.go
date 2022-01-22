package main

import (
	"log"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/cache"
	"github.com/gofiber/fiber/v2/middleware/cors"
	"github.com/gofiber/fiber/v2/middleware/logger"
	"github.com/gofiber/fiber/v2/middleware/monitor"
	"github.com/jalexanderII/flutter-golang/products"
	_ "github.com/jinzhu/gorm/dialects/sqlite"
)

func hello(c *fiber.Ctx) error {
	return c.SendString("Hello, World 👋!")
}

func setupRoutes(app *fiber.App) {
	api := app.Group("/products")
	api.Get("/dashboard", monitor.New())
	api.Get("/", hello)
	api.Get("/:percentage", products.GetProductByPercentage)
}

func main() {
	app := fiber.New()
	app.Use(cors.New())
	app.Use(cache.New())
	app.Use(logger.New())
	setupRoutes(app)
	log.Fatal(app.Listen(":3000"))
}
