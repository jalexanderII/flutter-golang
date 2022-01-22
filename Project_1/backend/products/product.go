package products

import (
	"fmt"

	"github.com/fatih/structs"
	"github.com/gofiber/fiber/v2"
)

type Product struct {
	Name  string  `json:"name"`
	Price float64 `json:"price"`
	Count int     `json:"count"`
}

func GetProductByPercentage(c *fiber.Ctx) error {
	fmt.Println("GetProductByPercentage called")
	percentage, err := c.ParamsInt("percentage")
	if err != nil {
		return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{"status": "error", "message": "Error on getting percentage", "data": err})
	}
	fmt.Println(percentage)
	fetchCount := len(productList) * percentage / 100
	if fetchCount > len(productList) {
		fetchCount = len(productList)
	}
	prodJson := make([]map[string]interface{}, fetchCount)
	for idx, prod := range productList[0:fetchCount] {
		prodJson[idx] = structs.Map(prod)
	}
	return c.JSON(prodJson)

}

var productList = []Product{
	{Name: "p1", Price: 25.0, Count: 30},
	{Name: "p2", Price: 20.0, Count: 10},
	{Name: "p3", Price: 250.0, Count: 320},
	{Name: "p4", Price: 256.0, Count: 340},
	{Name: "p5", Price: 24.0, Count: 300},
	{Name: "p6", Price: 10.0, Count: 333},
	{Name: "p7", Price: 105.0, Count: 123},
	{Name: "p8", Price: 225.0, Count: 345},
	{Name: "p9", Price: 251.0, Count: 111},
	{Name: "p10", Price: 258.0, Count: 666},
}
