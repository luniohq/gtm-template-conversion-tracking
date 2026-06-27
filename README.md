# Lunio Conversion Tracking — GTM Template

This template fires a Lunio conversion event directly from Google Tag Manager,
replacing the need to manually add a Custom HTML conversion tag. It supports
purchase and lead conversions across all Lunio-supported ad platforms.

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

## Step 2 — Get your Conversion ID
1. In Lunio, go to **System Settings > Integrations > Conversions**
2. Click **Create conversion** and configure your conversion
3. Click **Generate** then **View** in the Script column
4. Copy the **Conversion ID** (the ID passed to `LunioTrackConversion`)

## Template fields

### General
| Field | Required | Description |
|---|---|---|
| Conversion Type | Yes | Select **Purchase** or **Lead** |
| Conversion ID | Yes | Your Lunio conversion ID |

### Conversion Data *(purchase only)*
| Field | Description |
|---|---|
| Order ID | Map to your order ID variable e.g. `{{dlv - order_id}}` |
| Conversion Value | Map to your order value variable |
| Currency | Map to your currency variable (e.g. `GBP`) |
| Product ID | Map to your product ID variable |

### Ad Platforms *(purchase only)*
Enable the platforms you want to pass click and campaign data for. Each platform
exposes its own fields once enabled.

**Google**
| Field | Description |
|---|---|
| Click ID (GCLID) | Google click ID |
| Campaign ID | |
| Ad Group ID | |
| Keyword | |
| Match Type | |
| Network | |

**Meta**
| Field | Description |
|---|---|
| Click ID (FBCLID) | Meta click ID |
| Campaign ID | |
| Ad Set ID | |
| Ad ID | |

**LinkedIn**
| Field | Description |
|---|---|
| Click ID | LinkedIn click ID (li_fat_id) |
| Campaign Group ID | |
| Campaign ID | |
| Creative ID | |

**TikTok**
| Field | Description |
|---|---|
| Click ID (TTCLID) | TikTok click ID |
| Campaign ID | |
| Ad Group ID | |
| Ad ID | |

**Microsoft (Bing)**
| Field | Description |
|---|---|
| Click ID (msclkid) | Microsoft click ID |
| Campaign ID | |
| Ad Group ID | |
| Ad ID | |

**Twitter (X)**
| Field | Description |
|---|---|
| Click ID (twclid) | Twitter click ID |
| Campaign ID | |
| Ad Group ID | |
| Ad ID | |

**Reddit**
| Field | Description |
|---|---|
| Click ID (rdt_cid) | Reddit click ID |
| Campaign ID | |
| Ad Group ID | |
| Ad ID | |

**DV360**
| Field | Description |
|---|---|
| Click ID (dclid) | DV360 click ID |
| Campaign ID | |
| Insertion Order ID | |
| Line Item ID | |
| Creative ID | |

**Taboola**
| Field | Description |
|---|---|
| Click ID (tblci) | Taboola click ID |
| Campaign ID | |
| Campaign Item ID | |

**Pinterest**
| Field | Description |
|---|---|
| Click ID (epik) | Pinterest click ID |

## Step 3 — Setup in GTM
1. Add this template from the Community Template Gallery
2. Create a new tag using the **Lunio Conversion Tracking** template
3. Select your **Conversion Type** (Purchase or Lead)
4. Fill in your **Conversion ID** from the Lunio dashboard
5. For purchase conversions:
   - Map the Conversion Data fields to your data layer variables
   - Enable the ad platforms you are running and map their click ID and campaign fields
6. Set your trigger to the conversion event you want to track
   (e.g. purchase confirmation page, form submit)
7. Save and publish

## Notes
- This template is for **web (client-side) GTM containers** only
- The template will automatically wait for the Lunio mplat script to load
  before firing the conversion
- Platform fields only appear when the corresponding platform checkbox is enabled
- For help finding your credentials or configuring conversions,
  visit [lunio.ai](https://lunio.ai) or contact your account manager
