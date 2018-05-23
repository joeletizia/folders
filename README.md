# FrameFoldersEcto

An implementation of a project listing with a file system underneath backed by Postgres

## Getting Started
* Clone the repo to your local machine with `git clone ...`
* `cd frame_folders_ecto`
* `mix deps.get`
* In `apps/projects/config/config.exs` update your DB settings. If you have postgres running, it's probably fine to leave it alone.
* `mix ecto.create`
* `mix ecto.migrate`
* `MIX_ENV=test mix ecto.create` (is there a better way to do these? Like `rake db:test:prepare`)
* `MIX_ENV=test mix ecto.migrate`
* `mix test` => should be green. I wrote some simple tests to drive out the implementation and keep me on track.
* `mix phx.server`
* Navigate to `http://localhost:4000/api/projects`
* You'll see an empty JSON array returned.

You're all ready to go at this point, but you probably want some data.

I've set up some modules that act as contexts for interacting with the core domain of our app in the `projects` app. Those are `Projects`, `Files`, and `Folders`. To create a new project, simply call `Projects.create_new_project(name)`. A root folder will be created for you. You can create folders and files with that folder, or other folders via `Folders.create_folder(name, parent_folder)`. A version of `create_folder` exists to handle creating root folders, but you most likely do not want to use it. `File`s can be created similarly with `Files.create_file(name, media_url, parent_folder)`.

Here is some setup data you can run in `iex -S mix` to get started:

```
project_1 = Projects.create_new_project("project1")
root_folder = Folders.find_by_id_with_children(project_1.root_folder_id)

file_1 = Files.create_file("file name", "http://example.com/file1", root_folder)
sub_folder = Folders.create_folder("folder name", root_folder)
folder = Folders.create_folder("sub folder name", sub_folder)
```

Now when you return to your browser and refresh, you should see data. Each node contains a url to retrieve data for that node, so simply copy and past the URL field of a folder to get its contents.

If you have any questions, let me know. 
