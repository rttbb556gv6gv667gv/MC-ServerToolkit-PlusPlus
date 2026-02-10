# ============================================
# Loop Manager - Proper Tick System
# ============================================
# Her modül için ayrı tick counter
# Schedule yok, sadece scoreboard bazlı

# Scoreboards
scoreboard objectives add loop.counter dummy "Loop Counter"
scoreboard objectives add loop.interval dummy "Loop Interval"

# Constants
scoreboard players set #2 loop.counter 2
scoreboard players set #3 loop.counter 3
scoreboard players set #5 loop.counter 5
scoreboard players set #20 loop.counter 20
scoreboard players set #40 loop.counter 40

# Module intervals (ticks)
scoreboard players set #global loop.interval 3
scoreboard players set #admin loop.interval 2
scoreboard players set #addons loop.interval 5
scoreboard players set #security loop.interval 40
scoreboard players set #menu loop.interval 1
scoreboard players set #tracker loop.interval 20

# Initialize counters
scoreboard players set #global loop.counter 0
scoreboard players set #admin loop.counter 0
scoreboard players set #addons loop.counter 0
scoreboard players set #security loop.counter 0
scoreboard players set #menu loop.counter 0
scoreboard players set #tracker loop.counter 0

tellraw @a[tag=admin] {"text":"[Loop Manager] Tick sistemi başlatıldı!","color":"green"}
