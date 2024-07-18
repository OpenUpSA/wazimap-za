$(() =>
  $(
    '<div id="banner"><div class="wrapper">This version of Wazimap is no longer updated. Find the latest data at <a href="https://next.wazimap.co.za?onboarding=tutorial">next.wazimap.co.za</a>.</div></div>'
  ).appendTo("#page-header")
);
$(() =>
  $(
    `<div id="modal-new-wazi"  onClick="$('#modal-new-wazi').remove();" style="background-color: rgba(0, 0, 0, 0.5); position: fixed; top: 0; left: 0; height: 100vh; width: 100vw; z-index: 10000; display: flex; align-items: center; justify-content: center;">
        <div style="background-color: #fff; border-radius: 3px; position: fixed; width: 550px; padding: 30px 25px; line-height: 27.2px; font-weight: 400; font-size: 16px; box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.1);">
            <h1 style="line-height: 31.2px; font-weight: 700; font-size: 26px;">
                You are not viewing the latest data
                <button onClick="$('#modal-new-wazi').remove();" style="margin-top: -6px; background-color: transparent; border: none; float: right; cursor: pointer;"><svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M27.2422 25.6328C27.9023 26.2422 27.9023 27.3086 27.2422 27.918C26.9375 28.2227 26.5312 28.375 26.125 28.375C25.668 28.375 25.2617 28.2227 24.957 27.918L19.625 22.5859L14.2422 27.918C13.9375 28.2227 13.5312 28.375 13.125 28.375C12.668 28.375 12.2617 28.2227 11.957 27.918C11.2969 27.3086 11.2969 26.2422 11.957 25.6328L17.2891 20.25L11.957 14.918C11.2969 14.3086 11.2969 13.2422 11.957 12.6328C12.5664 11.9727 13.6328 11.9727 14.2422 12.6328L19.625 17.9648L24.957 12.6328C25.5664 11.9727 26.6328 11.9727 27.2422 12.6328C27.9023 13.2422 27.9023 14.3086 27.2422 14.918L21.9102 20.3008L27.2422 25.6328Z" fill="black"/></svg></button>
            </h1>
            <div style="margin-top: 1em; margin-bottom: 2em;">
                Wazimap is the most comprehensive source of local political and demographic data in South Africa, but this version is no longer updated. Visit the new Wazimap to see the latest data.
            </div>
            <a onMouseOver="this.style.backgroundColor = '#f77d4e';" onMouseOut="this.style.backgroundColor = '#f55b2c';" style="color: #fff; display: block; float: right; background-color: #f55b2c; border-radius: 3px; font-size: 16px; font-weight: 500; padding: 10px 15px; text-decoration: none;" href="https://next.wazimap.co.za?onboarding=tutorial">Visit next.wazimap.co.za</a>
        </div>
    </div>`
  ).appendTo("#page-header")
);
