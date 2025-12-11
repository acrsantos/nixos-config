{ ... }: {
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultOptions = [ 
      "--height 50%"
      "--layout=reverse-list"
      "--border sharp" 
      "--color=fg:-1,fg+:#f7f7f8,bg:-1,bg+:#262626"
      "--color=hl:#035e7b,hl+:#10a793,info:#36a3d9,marker:#96df71"
      "--color=prompt:#36a3d9,spinner:#f29c14,pointer:#10a793,header:#87afaf"
      "--color=border:#f7f7f8,label:#aeaeae,query:#d9d9d9"
      "--layout=\"reverse\""
    ];
  };
}
