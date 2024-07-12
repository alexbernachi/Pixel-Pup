extends Control


@onready var CoinUI = $HBoxContainer/CoinCounter

func _process(delta):
	CoinUI.text = "Coins: " + str(GameManager.TotalCoins)
