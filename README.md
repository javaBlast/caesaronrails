Реализация шифра Цезаря на Ruby on Rails + JavaScript для авторасшифровки

#main.html Main Page
Присутствуют два поля, одно для текста, второе для выбора смещения.
После ввода и подтверждения, содержимое сохраняются в PostgreSQL без изменений,
затем идет рендер show.html в который передаются данные из контроллера crypts_controller.
В моделе Crypt есть класс Caesar в котором реализована кодировка и декодировка с помощью методов,
с входящим тескстом. В show.html инициализируется класс Caesar.new(:shift) в который передаем смещение.
Исходная строка берется из модели базы данных, шифруется/дешифруется и через шаблонизатор Erb выводится
на страницу.
# views/crypts
Список сохраненных в базе данных текстов и смещений, с возможностью редактирования и удаления.
# views/crypts/[:id]
Получааем из бд текст+смещение, зашировуем и выводим на страницу.
Ниже диаграмма повторения букв в зашированном тексте.
Даные диаграммы обрабатываются в контроллере, и как hash передаются во view.
# pages/autodecrypt
В application.JS алгоритм авторасшифроки основанный на частотном методе.
Каждая буква в алфавите появляется с определенной переодичностью.
Если текст содержит достаточной кол-во символов для полсчета этой переодичности,
тогда скрипт определяет смещение , и расшифровует текст.