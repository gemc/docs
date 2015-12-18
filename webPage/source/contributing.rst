.. _contributingToGemc:

Contributing to gemc
====================

Please use this guideline to contribute to the gemc code development.

Quickstart
----------

* `Open a new issue <https://github.com/gemc/source/issues/new`_
* `Fork the repo <https://github.com/gemc/source>`_
* Create branches if necessary
* Create a pull request
* Keep fork in sync


Feel free to ask
================

So let's say that you have an idea for a great feature. It's a good idea 
to `open an issue <https://github.com/gemc/source/issues/new>`_ describing the feature and its implementation
and ask the code author's opinion. If they agree, go for it! They might even have some 
good suggestions for changes or additions to the feature as well.

If it's a bug you found, occasionally it can be ok to just create a **pull request** (PR),
as long as it's clearly a bug with a straightforward fix, but it's also not a bad idea
to file the bug as an issue first.

Finally, if you want to contribute but are not sure where, you can 
ask the author if they need help with anything — it could be as simple as helping 
improve the documentation.


Forking the repo
================

Ok, so we have a great feature idea (or we found a bug), we opened an issue to 
check with the author, and they signed off on it. Whoo! Time to get to coding. 
First thing you do is create a fork, that is a copy of the main repository.
Forking a repository allows you to freely experiment with changes without affecting 
the original project.


Forking a repository is a simple two steps process:

 1. On GitHub, navigate to the `gemc <https://github.com/gemc/source>`_ repository.
 2. In the top-right corner of the page, click Fork.

You now have a copy of the repo you just forked, available in your GitHub account; its **fork-url-address**
can be found on the right menu. You can now clone it to your local machine and work on it.

You can `create a pull request`_ based on this fork. If you are working on several new features at once, you
can `create a branch`_ for each feature.

For long-term modifications it is highly desirable to `keep the fork in sync with the original repo`_.


Code Standards
==============

When writing both commits and code, it's important to do so in harmony with a 
project's existing style.
If the project uses camelCase variable naming, this is how you should name
your variables as well. If the project has a test suite, you should be 
writing tests for any changes you make.

Even if you don't agree with some of the author's stylistic decisions, 
you should adhere to them in your PR. If you have a solid reason why they 
should be changed, open up an issue and discuss it there. Never ever change 
an author's existing code style to something you prefer, this is in 
extremely poor taste.


Create a Pull Request
======================
To create the pull request, navigate in github to your fork,
and click on the PR button:

.. image:: pr.png
 :align: center

You will be presented with a page with a summary of your changes. Once
you're ready, go ahead and press the PR button to provide additional informations:

* Make sure you selected the correct branch name ("master" if it's the main fork)
* Make sure the title and description are clear and concise
* If the change is visual, make sure to include a screenshot or gif
* If the PR closes an issue, make sure to put Closes #X at the end of the description on a newline

Then let's go for it and open it up!


Expect a Thorough Review
========================
So the pull request has been submitted, and now it's time for review. As you would if
someone sends you a PR, you should expect the maintainer to be reviewing every line of code.
Do not be offended by this, keep in mind that any feedback is in good sprit,
and just meant to make the project better.

Once all has been approved, any changes have been made, and the commits and code are clean,
your PR should be ready for merge.

\
\


Documentation
=============

* `gemc home page <gemc.jlab.org>`_
* `gemc GitHub <https://github.com/gemc>`_
* `GitHub workflow <https://help.github.com/articles/fork-a-repo/>`_
* ask the author: email ungaro@jlab.org
* open an issue:

 1. click on the "issues" link on the right menu of the source repository
 2. clcik on the green button "New Issue".

* `create a branch`_

\
\


Keep the fork in sync with the original repo
============================================
You can keep your fork up-to-date with the gemc repository.
cd to the local copy of your fork and type:

.. code-block:: bash

 git remote add upstream https://github.com/gemc/source.git

To verify the new upstream repository you've specified for your fork,
type *git remote -v*. You should see the URL for your fork as origin,
and the URL for the original repository as upstream.

You're now ready to sync a fork. First, fetch the commits:

.. code-block:: bash

 git fetch upstream

Then change to your master fork:

.. code-block:: bash

 git checkout master

Finally, merge the changes from the upstream/master to your local master fork.
This brings your fork's master branch into sync with the gemc repository,
without losing your local changes.

.. code-block:: bash

 git merge upstream/master

\
\
Create a branch
===============

You can create a branch with a name that summarize your modifications.

For example, if John wants to fix a gui problem, a good branch-name would be:

.. centered:: john-guifix


To create a branch, first clone your fork locally, by running git on a terminal.

.. code-block:: bash

 git clone fork-url-address

This will install a local copy of your fork.

Now you can create a branch with the command:

.. code-block:: bash

 cd reponame
 git checkout -b branch-name


Tadaa! You're now working on a new branch, on a repo that you can commit to.



\
\










