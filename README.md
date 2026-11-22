# README

This was my first major personal project (diverting me working on projects supplied by [The Odin Project's](https://www.theodinproject.com/) Ruby on Rails curriculum. The first site I was very product to showcase and that I launched from an AWS EC2 Instance (An Amazon virtual private server). 

The original site idea was focused on learning on building a dynamic website that could be updated with posts (crafts) from admins but allowed users to create accounts to post comments.

I started working on a redesign to allow for selling as a e-commerce website to further learning.
- Benefit from having a custom built website to stand out from others
- Traffic can come from social medias already established
- Stripe processing fees are smaller than others (ETSY)
- Allow custom sales (and perks, such as free shipping on orders over $59 or Promo Codes)

## Current Site Vision
As of 2026/11/21
- Allow the selling of crafts using Stripe for hosted checkouts
- Major refactoring of crafts to allow variants (such as colors/sizes offered on a craft)
- CSS refactor for mobile first design (Normal development routine for most sites - Vast majority of users expected to be mobile)

The site is being continuously updated to fix bugs and implement ideas.

## Known Issues/Bugs
- Notice/alerts push DOM elements below physically down on screen
- Better Color scheme (temp-h2: indigo should have a better name and indigo could fit, but was used as a "close enough" color placeholder)
- Store
- Crafts with Variants "default page" should not be named "default"
  - e.g. /crafts/gummy-bear-necklace links base craft with "select:" set on default.
  - Ideally better name for selector and base craft named "default"
    - Make it so variant options are more obvious and/or loads up first non-base variant (such as red)

- Craft and Variant backend implementation - [further discussed below](#crafts-and-variants)
  - Functional but I'm positive a senior could point out obvious improvements in handling how to sell crafts that may or may not have variants
  - First hand experience designing systems and personally experiencing shortcomings is the best way to learn and ponder how these could've been improved
  - AI offered different solutions but I wanted to personally understand the entire backend and not just offload mentally
    - Questioned how large of a context window would be needed for this and how ugly it would be to wrangle AI around entire codebase whilst not understanding why certain decisions were made
      - In addition to [the horrid idea of] wrangling code as what was needed changed as I refactor the site-rework (far easier if you implement everything yourself)
        
- Locking for crafts going to checkouts new
- Back button after adding craft to cart just "refreshes" page instead going to last url

## Future Ideas
- Simple feedback form (Report bugs users encounters or just general feedback)
  - More straight forward the better to increase feedback rates from users (less churn important when users are expected to be in low numbers)
  - Could send email to personal email
  - Probably just create a Feedback record and allow admins to check these records.
    - Could setup a cron to email all Feedback records weekly.
      - Keep email costs low (Yes these are very low, but I dislike the ability for users/bots to spam emails however marginal the costs)
      - Benefit from email notifications (better than manually checking the site)
  
- Sales / Promo Codes
- Free Shipping over $x
- Subcategories (e.g. condense earrings and necklaces into jewelry category - retain originals into subcategory)
- Tags on crafts
  - Better keyword search
  - Could implement filtering by tags
 
- Allow admins to update orders when shipping and delivered to user
- Automate tracking information if possible (for sending links to this over email and links on orders)

## Crafts and Variants
All Craft records have a Variant record.
A craft meant only as itself (e.g. no small/medium/large) has a singular variant with only "dummy" info on a "dummy variant", everything important is on the Craft record.
A craft with variants checked to have at least 2 variants (dummy variant + real variant(s)).
 - Craft record becomes the "base craft"
 - Variant records become what is used for selling (stocks, price, name on product/receipt)

## Credits

Use of Milk carton for favicon [Freepik](https://www.flaticon.com/free-icon/milk-box_3500274?term=milk+carton&page=1&position=5&origin=search&related_id=3500274).
Further credit for assets on the [Site - Filthy Chai](https://filthychai.me/home/about).
