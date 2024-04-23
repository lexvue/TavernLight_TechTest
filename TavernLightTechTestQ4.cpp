
#include <stdio.h>
#include <cstring>
#include <string>

class Game {
    class Player {};
    class Item {};


// Question 4
    void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
    {
        Player* player = g_game.getPlayerByName(recipient);
        if (!player) {
            player = new Player(nullptr);
            if (!IOLoginData::loadPlayerByName(player, recipient)) {
                //I assume loadPlayerByName will point player to the correct Player object so if it gets to this point and still fails, it should be freed because it will leak
                delete(player);
                return;
            }
        }

        Item* item = Item::CreateItem(itemId);
        if (!item) {
            return;
        }

        g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

        if (player->isOffline()) {
            IOLoginData::savePlayer(player);
        }
    }












};