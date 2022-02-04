#include <iostream>
#include <assert.h>

#include <SFML/Graphics.hpp>

int main()
{
#if defined(_DEBUG)
	_CrtSetDbgFlag(_CRTDBG_ALLOC_MEM_DF | _CRTDBG_LEAK_CHECK_DF);
#endif
	
    sf::RenderWindow m_window(sf::VideoMode(800, 800), "GuiDemo", sf::Style::Close);
    sf::View m_view(sf::FloatRect(0, 0, 800, 800));

    sf::Clock clock = {};
    sf::Event event = {};

    while (m_window.isOpen())
    {
        while (m_window.pollEvent(event))
        {
            if (event.type == sf::Event::Closed)
                m_window.close();
        }

        float frametime = clock.restart().asSeconds();
 
        m_window.clear();

        m_window.display();
    }

    return 0;
}
