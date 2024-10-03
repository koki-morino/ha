#include <iostream>

int main() {
    std::cout << "Content-type:text/html\r\n\r\n";
    std::cout << "<html>\n";
    std::cout << "<head>\n";
    std::cout << "<title>Hello World!</title>\n";
    std::cout << "</head>\n";
    std::cout << "<body>\n";
    std::cout << "<h1>Hello World!</h1>\n";
    std::cout << "</body>\n";
    std::cout << "</html>\n";

    return 0;
}
