## Squircle and rounded cube openScad modules
Modules for OpenScad that draw a parallelepiped with rounded edges. In other words, these are analogs of the OpenScad "cube" function, only with rounding.
Two modules are presented:
* The usual "roundedCube", which rounds the corners of the rectangle lying at the base of the parallelepiped using circles.
* The more modern "squircleCube", where a "squircle" is used instead of a rectangle at the base of the parallelepiped.

A "squircle" is a special curve that follows the equation  
![equation](https://i.upmath.me/svg/%5Cleft%7Cx%5Cover%20a%5Cright%7C%5En%2B%5Cleft%7Cy%5Cover%20b%5Cright%7C%5En%3D1.)  
Where *a* is the length along the X axis, *b* is the length along the Y axis, *n* is the parameter responsible for the power of rounding.
More details about the quad circle can be found in [Wikipedia](https://en.wikipedia.org/wiki/Squircle).  
In short, the use of such curves gives a smoother rounding of the corners of the rectangle without sharp transitions. In this case, it is convenient to adjust the power of rounding by changing the parameter *n*. Then greater the *n* - then less the power of rounding. For example, for *n* = 1 - there will be an ellipse.  
In addition, the squircleCube module renders faster than roundedCube.

Модули для OpenScad, которые рисуют параллелепипед со скруглёнными краями. Другими словами, это аналоги функции cube в OpenScad, только со скруглением.
Представлено два модуля:
* Обычный "roundedCube", который скругляет углы прямоугольника, лежащего в основании параллелепипеда, при помощи окружностей.
* Более современный "squircleCube", где вместо прямоугольника в основании параллелепипеда используется "квадрокруг".

Квадрокруг - это особая кривая, которая сооветствует уравнению  
![equation](https://i.upmath.me/svg/%5Cleft%7Cx%5Cover%20a%5Cright%7C%5En%2B%5Cleft%7Cy%5Cover%20b%5Cright%7C%5En%3D1.)  
Где a - длина по оси X, b - длина по оси Y, n - параметр, отвечающий за степень скругления.
Более подробно про квадрокруг можно прочитать в [этой](https://habr.com/ru/company/droider/blog/517298/) статье на хабре или [Википедии](https://en.wikipedia.org/wiki/Squircle) (анг.).  
Если кратко, то использование таких кривых даёт более плавное скругление углов прямоугольника без резких переходов. При этом удобно регулировать степень скругления, изменяя параметр n. Чем больше n - тем меньше степень скругления. Например, для n = 1 - будет элипс.  
Кроме того модуль squircleCube рэндерится быстрее, чем roundedCube.