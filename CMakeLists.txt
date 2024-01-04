cmake_minimum_required(VERSION 3.12)
project(MyCalculatorProject)

set(CMAKE_CXX_STANDARD 11)

# Вказуємо шляхи до вихідного коду та включених файлів
set(SRC_DIR src)
set(INC_DIR include)
set(BUILD_DIR build)
set(LIB_DIR lib)

# Знаходимо всі файли з розширенням .cpp у папці src
file(GLOB SRCS ${SRC_DIR}/*.cpp)

# Створюємо об'єктні файли з вихідного коду
add_executable(my_calculator_app ${SRCS})

# Вказуємо шлях до включених файлів
target_include_directories(my_calculator_app PRIVATE ${INC_DIR})

# Створюємо папки для об'єктних файлів та бібліотек
set_target_properties(my_calculator_app PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${BUILD_DIR}
)

# Створюємо статичну бібліотеку
add_library(calculator_lib STATIC ${SRCS})
set_target_properties(calculator_lib PROPERTIES
    OUTPUT_NAME calculator
    ARCHIVE_OUTPUT_DIRECTORY ${LIB_DIR}
)

# Якщо вам потрібна бібліотека shared (динамічна), то розкоментуйте наступні рядки
# add_library(calculator_lib SHARED ${SRCS})
# set_target_properties(calculator_lib PROPERTIES
#     OUTPUT_NAME calculator
#     LIBRARY_OUTPUT_DIRECTORY ${LIB_DIR}
# )

# Вказуємо, що my_calculator_app використовує calculator_lib
target_link_libraries(my_calculator_app PRIVATE calculator_lib)
