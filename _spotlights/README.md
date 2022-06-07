---
published: false
---

# Articles
This repository contains all articles published on CHTC, PATh, and HTCSS websites. It seperates them out so we can deploy the same article more easily and reduce build times well creating articles. You can preview the articles here -> [Article Previews]([preview website](https://chtc.github.io/article-preview/)).

### Guide
- [Creating a new Article](#creating-a-new-article)
- [Previewing your Article](#previewing-your-article)
- [Deploying your Article](#deploying-your-article)

## Creating a new Article

**Best practice is to create your article as a preview first. Look at [the preview guide](#previewing-your-article) for details.** 

To create a new article you must follow the following steps:
1. [Create a new Branch](#create-a-new-branch)
2. [Add a new Article](#add-a-new-article)
3. [Populate the new Article](#populate-the-new-article)
4. [Create a Pull-Request to merge the article into production](#create-a-pull-request-to-merge-the-article-into-production)

### Create a new Branch

Each Article should have its own branch. We use branches to manage 
when we put each article into production. So if two changes are on 
one branch we are forced to wait until both of those changes are ready
for production.

### Add a new Article

Once you are in your new branch you can Add file -> Create new file.

You should use the format below as the file name with the estimated
date for when you plan to publish the article. This should be updated 
to the actual date it is made public in the future.

```markdown
YEAR-MONTH-DAY-title.md
```

### Populate the new Article

These articles are distributed to a variety of websites so it is 
important they follow the same template. 

Below you will find the yaml frontmatter that is read by the website 
to fill in information about the article. 

_Add this frontmatter to the top and the article content will go below_

```yaml
---
title: <Article Title>

author: <First Last>

publish_on:
  - <htcondor, path, osg, chtc> - This indicates what website this article will be shown on
  - <htcondor, path, osg, chtc> - If more then one then add as a list
  
type:
  - <news, user> - This indicates if this article is based on a user's experience with our services or a news story about what we have done. 

canonical_url: <This is a absolute url that points to the canonical site>

image:
  path: <https://raw.githubusercontent.com/CHTC/Articles/main/images/...> - An image that will populate the link preview
  alt: Text Description of image
  
description: <This is used as a link description when this article is linked>
excerpt: <Same as description but used for the cards>

card_src: <https://raw.githubusercontent.com/CHTC/Articles/main/images/...> - An image that will be used in the article cards
card_alt: Text Description of image

banner_src: <https://raw.githubusercontent.com/CHTC/Articles/main/images/> - Optional - An image that will be used as a website banner
banner_alt: Text Description of image
---
```

### Create a Pull-Request to merge the article into production

When you are confident with your content you can create a Pull-Request,
which is a request to have your content moved to production. To do this 
go the Pull Requests tab and choose your branch as the compare branch.

Ping the people you would like to review your article,
and they will look it over make suggestions/approve your article.

At this point it can be merged into main.

### Things to remember when working in this folder

- `date` is omitted on purpose, Jekyll populates this field from the filename.
    - Discrepancy in front matter and filename dates can cause unexpected results

- All images must be absolute
    - As these images will be served from a variety of folders and depths you must use an absolute url 
    - Absolute URL to use: `https://raw.githubusercontent.com/CHTC/Articles/main/images/`
    - You should put all of your articles in the main folder and import from there even in the dev branch
  
## Previewing your Article
  
Best practice is to create your article in our development
branch first so that you can view it as if it was in production.

To view your article in development you must:
- Change into the development branch
  - You can do this with the github navigation or click [here](https://github.com/CHTC/Articles/tree/development)
- Create a new file
  - This will use the same logic as steps [2](#add-a-new-article) and [3](#populate-a-new-article) of the guide above.
- View your article
  - When you commit your changes you can view your article ( after a couple of minutes to process ) on the [preview website](https://chtc.github.io/article-preview/)
- When you are ready to move this article to production you can copy and paste this article and its images using the [Creating a new Article](#creating-a-new-article) guide. 
- You can see if your change has been made to the website by following the top build [here](https://github.com/CHTC/article-preview/actions/workflows/pages/pages-build-deployment). After this circle is green it will be live on the preview page. 

## Deploying your Article

These articles get deployed across 4 websites based on what you have put in your 'publish_on' list.

- [CHTC](https://github.com/CHTC/chtc-website-source)
- [OSG](https://github.com/osg-htc/osg-htc.github.io)
- [PATh](https://github.com/path-cc/path-cc.github.io)
- [HTCondor](https://github.com/htcondor/htcondor-web)

After your Pull Request has been merged into the 'main' branch on this repo you must deploy it to the other sites. 

The steps to do this are:
 
1. Go to the site and run the 'Update Submodules' workflow. We use this to pull your changes into the new repo and create a new branch called 'preview-update-submodules'. You then will have to manually trigger a preview page build using another action

- [CHTC Submodule Workflow](https://github.com/CHTC/chtc-website-source/actions/workflows/update-submodules.yml)
- [OSG Submodule Workflow](https://github.com/osg-htc/osg-htc.github.io/actions/workflows/update-submodules.yml)
- [PATh Submodule Workflow](https://github.com/path-cc/path-cc.github.io/actions/workflows/update-submodules.yml)
- [HTCondor Submodule Workflow](https://github.com/htcondor/htcondor-web/actions/workflows/update-submodules.yml)

- [CHTC Preview Workflow](https://github.com/CHTC/chtc-website-source/actions/workflows/deploy-preview.yml)
- [OSG Preview Workflow](https://github.com/osg-htc/osg-htc.github.io/actions/workflows/deploy-preview.yml)
- [PATh Preview Workflow](https://github.com/path-cc/path-cc.github.io/actions/workflows/deploy-preview.yml)
- [HTCondor Preview Workflow](https://github.com/htcondor/htcondor-web/actions/workflows/deploy-preview.yml)
 
![Run the Update Submodules Workflow](/images/Submodule_Image.png)

After this has ran you will see a branch called 'preview-update-submodules' and you should create a pull request into master from this branch. 

- [CHTC Create PR](https://github.com/CHTC/chtc-website-source/compare/master...preview-update-submodules)
- [OSG Create PR](https://github.com/osg-htc/osg-htc.github.io/compare/master...preview-update-submodules)
- [PATh Create PR](https://github.com/path-cc/path-cc.github.io/compare/master...preview-update-submodules)
- [HTCondor Create PR](https://github.com/htcondor/htcondor-web/compare/master...preview-update-submodules)

You can preview your update on the website preview, ( **Remember this takes a bit** ).

- [CHTC Submodule Update Preview](https://chtc.github.io/web-preview/preview-update-submodules)
- [OSG Submodule Update Preview](https://osg-htc.org/web-preview/preview-update-submodules)
- [PATh Submodule Update Preview](https://path-cc.io/web-preview/preview-update-submodules)
- [HTCondor Submodule Update Preview](https://htcondor.com/web-preview/preview-update-submodules)

When you get a review on this page, you can merge into master and your article will be deployed.

**Important**: After you merge delete the 'preview-update-submodules' branch. You **cannot** start this workflow on this site again until it is gone.
