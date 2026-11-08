# Global instructions

## Comments

Never add comments to code you write or edit, unless the user explicitly asks for them.

## Grilling

When the user asks to be grilled ("grill me", `/grill-me`, "drill me"), use the `grill-me` skill. Never use `mattpocock-skills:grilling`.

When an agent returns **Questions for the user**, don't answer them yourself. Run the `grill-me` skill on them with the user, then resume that agent with SendMessage, passing the answers as a Decision Log.
