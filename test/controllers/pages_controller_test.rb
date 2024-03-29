# require 'test_helper'

# class PagesControllerTest < ActionDispatch::IntegrationTest
#     include Devise::Test::IntegrationHelpers

#     # setup users 1 and 2 and goup with image
#     setup do
#         user = User.new(avatar: '', email: 'jad@gamil.com', username: 'jaasdmiewiggins', first_name: 'jamie', last_name: 'wiggins', password: 'jamie1234')
#         user.save
#         @user = user
#         sign_in @user
#     end
  
#     # success case: should get the root path (home) and templates
#     test "should get home" do
#       get root_path
#       assert_response :success

#       assert_template layout: 'application'
#         assert_template 'activities/_activity'
#         assert_template 'pages/home'
#         assert_template 'shared/_alert'
#         assert_template 'shared/_header'
#         assert_template 'shared/_footer' 
#     end
  
    # # success case: should get profile and templates
    # test "should get profile" do
    #     sign_in @user
    #     get ("/user/"+@user.username)
    #     assert_response :success

    #     assert_template layout: 'application'
    #       assert_template 'shared/_relation' 
    #       assert_template 'posts/_post' 
    #       assert_template 'shared/_group' 
    #       assert_template 'pages/profile' 
    #       assert_template 'shared/_alert' 
    #       assert_template 'shared/_header' 
    #       assert_template 'shared/_footer' 
    # end

    # # failure case: does not get profile page when user is not signed in
    # test "should not get profile when no user signed in" do
    #   get ("/user/"+@user.username)
    #   assert_redirected_to new_user_session_url
    # end

    # # success case: posts request contact with no email
    # test "should post request contact but no email" do
    #   post request_contact_url
    #   assert_response :redirect
    #   assert_not_empty flash[:alert]
    #   assert_nil flash[:notice]
    # end

    # # success case: should get group page and templates
    # test "should get group" do 
    #   sign_in @user  
    #   post ('/groups'), params: {group: {name: @group.name, admin_id: @user_id, image: @group_image}} do 
    #   get ("/group/"+@group.name) 
    # end
    #   assert_response :success

    #   assert_template layout: 'application'
    #     assert_template 'groups/_form'
    #     assert_template 'groups/new'
    #     assert_template 'shared/_alert'
    #     assert_template 'shared/_header'
    #     assert_template 'shared/_footer'
    # end

    # # failure case: should not get group when there is no user signed in
    # test "should not get group when no user signed in" do
    #   get ("/group/"+@group.name) 
    #   assert_redirected_to new_user_session_url
    # end

    # # success case: should get contact and templates
    # test "should get contact" do
    #   sign_in @user
    #   get ("/contact")
    #   assert_response :success
    
    #   assert_template layout: 'application'
    #     assert_template 'pages/contact'
    #     assert_template 'shared/_alert'
    #     assert_template 'shared/_header'
    #     assert_template 'shared/_footer'
    # end

    # # failure case: should not get contact when no user is signed in
    # test "should not get contact unless user is signed in" do
    #   get ("/contact")
    #   assert_redirected_to new_user_session_url
    # end
#end
