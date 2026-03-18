# Lunio Conversion Tracking — GTM Template

This template installs the Lunio conversion tracking script and fires a 
conversion event directly from Google Tag Manager, replacing the need to 
manually create a Custom HTML tag.

## Prerequisites

- A Google Tag Manager **web container**
- A Lunio account with admin access
- A generated conversion script from the Lunio dashboard

## How to get your credentials

1. In Lunio, go to **System Settings > Integrations > Conversions**
2. Click **Create conversion** and configure your conversion
3. Click **Generate** then **View** in the Script column
4. From the script, copy:
   - The **Script URL** (the `src` value in the script tag)
   - The **Conversion ID** (the UUID passed to `LunioTrackConversion`)

## Template fields

| Field | Required | Description |
|---|---|---|
| Script URL | Yes | Your unique Lunio script URL from the dashboard |
| Conversion ID | Yes | Your Lunio conversion UUID |
| Order ID | No | Optional. Map to your order ID variable e.g. `{{dlv - order_id}}` |

## Setup in GTM

1. Add this template from the Community Template Gallery
2. Create a new tag using the **Lunio Conversion Tracking** template
3. Fill in your Script URL and Conversion ID from the Lunio dashboard
4. Optionally map Order ID to a data layer variable if you want to pass 
   order values
5. Set your trigger to the conversion event you want to track 
   (e.g. purchase confirmation page, form submit)
6. Save and publish

## Notes

- This template is for **web (client-side) GTM containers** only
- The script will only be injected once per page even if the tag 
  fires multiple times
- For help finding your credentials or configuring conversions, 
  visit [lunio.ai](https://lunio.ai) or contact your account manager
