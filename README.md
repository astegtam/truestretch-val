# truestretch-val
The only working true stretch resolution method for Valorant after the 13.01 patch.

## ⚠️ Disclaimer & Educational Purpose
This project is created strictly for **educational and research purposes** to demonstrate how aspect ratio modifications interact with game engines. 

* **Use at your own risk:** The author is NOT responsible for any bans, suspensions, or punishments issued by Riot Games or Vanguard.
* **No Advantage:** This method does not provide an unfair advantage or cheat functions; it is purely a visual resolution preference.
* **Compliance:** We do not encourage breaking Riot Games' Terms of Service. By using this, you accept full responsibility.

---

## 🛠️ Requirements & Setup Guide

This is currently the only working true stretch method available, alternative to the 1:45 ratio method (e.g., 1280x882, 1280x880, 1440x990). 

### Step 1: Monitor Configuration
To utilize this method, you must first disable your secondary/main monitor virtual entries through the **Device Manager**. 

<img width="506" height="427" alt="image" src="https://github.com/user-attachments/assets/06b6ac4c-bcd3-4e25-9a1f-94e81d7d2c7a" />

<img width="765" height="458" alt="image" src="https://github.com/user-attachments/assets/34d6392b-58fb-41ea-8cb7-098aa8612ba8" />

### Step 2: NVIDIA Control Panel Settings
Open the **NVIDIA Control Panel** (or your GPU's respective software) to configure your custom resolution. Commonly preferred stretched resolutions like `1440x1080` or `1280x960` might already exist. If not, follow the steps below to create one:

> 📌 **Reminder:** Ensure that your scaling mode is set to **Full-screen** in the desktop size and position settings.

<img width="940" height="704" alt="image" src="https://github.com/user-attachments/assets/3b4f9d52-4628-4c73-b520-fb8d7c2a8fb2" />

1. Navigate to the **Change Resolution** section:
<img width="942" height="700" alt="image" src="https://github.com/user-attachments/assets/6098c858-f088-4f52-917f-d0b66ce2fde1" />

2. Click on the **Customize...** button. 
*(Note: If the Customize button is grayed out, it means you are currently selecting a resolution from the "Ultra HD, HD, SD" category).*
<img width="259" height="167" alt="image" src="https://github.com/user-attachments/assets/835a255b-6e70-4ea9-ad03-72836a846d79" />

3. Scroll down and make sure you select a resolution from the **PC** category instead:
<img width="253" height="181" alt="image" src="https://github.com/user-attachments/assets/9cc70dae-0f32-4be3-aaf9-55263eafcdfb" />

4. Now click on **Customize**:
<img width="536" height="541" alt="image" src="https://github.com/user-attachments/assets/37e99a76-5dc6-40c5-9da0-7eedeb4ae763" />

5. Click on **Create Custom Resolution...**:
<img width="519" height="519" alt="image" src="https://github.com/user-attachments/assets/47a59d74-3a17-403f-9267-21baeea079b0" />

6. Enter your desired resolution (e.g., `1080x1080` or any other preference). 
*(Crucial: Make sure to type your exact native **Refresh Rate (Hz)** to maintain maximum performance).* Click **Test**, then save it by pressing **OK**.

7. Your custom resolution is now successfully created. If it doesn't immediately appear at the top of your resolution list, go back to the Customize menu and verify that the checkbox next to your custom resolution is ticked/activated.
<img width="519" height="529" alt="image" src="https://github.com/user-attachments/assets/73750d00-8dba-457f-9ce6-6a6250674ca7" />

---

---

## 🚀 How to Use & Run the Script

Once your custom system resolution is ready, follow these exact steps to make the stretch method work correctly in-game:

### Important In-Game Steps:
1. Launch Valorant and make sure your in-game display mode is set to **Windowed Fullscreen**.
2. Start a match. Wait until you actually spawn in and are able to move your character around.
3. Once you can move, press **`F8`** to trigger the stretch resolution mode.
4. **When the match ends:** Press **`F8`** again to restore your original native resolution.
5. **Repeat every match:** You must repeat this process every time you enter a new match, otherwise the engine won't apply the stretch properly. 

> ⚠️ *Note: It might feel a bit annoying to toggle it every match, but this is currently the most practical and stable workaround available after the recent patches.*

### Troubleshooting Tip:
If you have just installed Python freshly on your system, you might need to run the script twice or restart your computer for the environment variables and shortcut hooks to update properly.

---

## 📞 Support & Contact
For any questions, bug reports, or assistance, feel free to reach out via Discord:
💬 **Discord:** `astegtam`
