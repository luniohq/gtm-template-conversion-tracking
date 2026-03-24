# Lunio Conversion Tracking — GTM Template

This template fires a Lunio conversion event directly from Google Tag Manager, 
replacing the need to manually add a Custom HTML conversion tag.

## Prerequisites
- A Google Tag Manager **web container**
- A Lunio account with admin access
- The **Lunio mplat script** already installed on your site (see below)

## Step 1 — Install the Lunio mplat script
Before using this template, the Lunio mplat script must be installed on your site.
Add the following to the `<head>` of every page, or via a GTM Custom HTML tag 
on All Pages:
```html
<script>
  if(!document.getElementById('lunioScript')) {
    var lunioScript = document.createElement('script');
    lunioScript.id = 'lunioScript';
    lunioScript.async = true;
    lunioScript.src = 'YOUR_LUNIO_MPLAT_SCRIPT_URL';
    document.head.appendChild(lunioScript);
  }
</script>
```

## Step 2 — Get your credentials
1. In Lunio, go to **System Settings > Integrations > Conversions**
2. Click **Create conversion** and configure your conversion
3. Click **Generate** then **View** in the Script column
4. From the script, copy:
   - The **Conversion ID** (the ID passed to `LunioTrackConversion`)

## Template fields
| Field | Required | Description |
|---|---|---|
| Conversion ID | Yes | Your Lunio conversion ID |
| Order ID | No | Optional. Map to your order ID variable e.g. `{{dlv - order_id}}` |

## Step 3 — Setup in GTM
1. Add this template from the Community Template Gallery
2. Create a new tag using the **Lunio Conversion Tracking** template
3. Fill in your Conversion ID from the Lunio dashboard
4. Optionally map Order ID to a data layer variable if you want to pass 
   order values
5. Set your trigger to the conversion event you want to track 
   (e.g. purchase confirmation page, form submit)
6. Save and publish

## Notes
- This template is for **web (client-side) GTM containers** only
- The template will automatically wait for the Lunio mplat script to load 
  before firing the conversion
- For help finding your credentials or configuring conversions, 
  visit [lunio.ai](https://lunio.ai) or contact your account manager
