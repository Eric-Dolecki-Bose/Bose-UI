![header](./ed-badge.png)

----

# Bose-UI
A collection of often-used UI elements such as buttons, etc. Hopefully will create a private cocoapod repo for this stuff. GothamSSm fonts are integrated into this project too. 

### Bose Buttons

#### enum Types:
- Dark
- Light
- Primary
- PrimaryDestructive
- Secondary
- SecondaryDestructive
- Facebook
- Amazon

### Screen Brightness / Theme Switching
There is currently a reading of screen brightness and a notification if it changes. If it changes while the application is active, it can be assumed to be a dynamic change based on the screen dimming while the user is in a dark environment. Thus we can dynamically change the theme based on this reading. ThemeManager support to come soon. 

### Theme Colors
I have added some theme colors which can be accessed like so:

```swift
let color = UIColor.FlatColor.Blue.Denim
```

Currently supported theme colors:

**Green**
- Fern
- MountainMeadow
- ChateauGreen
- PersianGreen

**Gray**
- AlmondFrost
- WhiteSmoke
- IronGray
- Iron

**Blue**
- PictonBlue
- Mariner
- CuriousBlue
- Denim
- Chambray
- BlueWhale

**Violet**
- Wisteria
- BlueGem

**Yellow**
- Energy
- Turbo

**Orange**
- NeonCarrot
- Sun

**Red**
- TerraCotta
- Valencia
- Cinnabar
- WellRead
----
![app](./bose-ui-app.png)
