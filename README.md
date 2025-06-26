<h1 align="center"> 🍃 Hasonako Build 🍃 </h1>

<!-- INFORMATION -->
### 📝 Intro

This is a very early version of my rice — I’ve just switched to Linux.
And yes, I started with Arch Linux and BSPWM.

The setup is a patchwork of inspiration from around the community, with clear influence from [Zproger](https://github.com/Zproger).  
I'm slowly shaping it into something more personal.  
(Even this README was put together with the help of his layout.)

> ⚠️ Warning: This installer modifies your existing config and installs many packages. Use on a clean Arch setup.  

<h1 align="left"> :blue_book: About</h1> 

<img src="Screenshots/screen1.png" alt="rice" align="right" width="500px">

</br>

 - OS: [**`Arch Linux`**](https://archlinux.org/)
 - WM: [**`BSPWM`**](https://github.com/baskerville/bspwm)
 - Bar: [**`Polybar`**](https://github.com/polybar/polybar)
 - Compositor: [**`Picom`**](https://github.com/yshui/picom)
 - Terminal: [**`Kitty`**](https://github.com/kovidgoyal/kitty)
 - App Launcher: [**`Rofi`**](https://github.com/davatorium/rofi)
 - Notify Daemon: [**`Dunst`**](https://github.com/dunst-project/dunst)

</br>

<!-- IMAGES -->
### 🖼️ Gallery

| ![1](Screenshots/screen1.png) | ![2](Screenshots/screen2.png) | ![3](Screenshots/screen3.png) |
|---|---|---|

<!-- INSTALLATION -->
## :blue_book: Installation
```bash
git clone https://github.com/hasonako/MaRice
cd MaRice
chmod +x installer.sh
./installer.sh
```
<!-- HOTKEYS -->
## 💻 HotKeys

* **Open the terminal** - `super + enter`
* **Switch the layout** - `shift + alt`
* **Open the application menu** - `super + d`
* **Launch Telegram** - `super + shift + t`
* **Close the window that is in focus** - `super + c`
* **Take a screenshot** - `print`
* **Restart bspwm** - `ctrl + shift + r`
* **Quit bspwm** - `ctrl + shift + q`
* **Switch to another desktop** - `super + 1-6`
* **Move the window to another desktop** - `super + ctrl + left/right`

The other hotkeys are in `~/.config/sxhkd/sxhkdrc`.
